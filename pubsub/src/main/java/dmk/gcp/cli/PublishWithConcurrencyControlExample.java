package dmk.gcp.cli;

import com.google.api.core.ApiFuture;
import com.google.api.core.ApiFutures;
import com.google.api.gax.core.ExecutorProvider;
import com.google.api.gax.core.InstantiatingExecutorProvider;
import com.google.cloud.pubsub.v1.Publisher;
import com.google.protobuf.ByteString;
import com.google.pubsub.v1.PubsubMessage;
import com.google.pubsub.v1.TopicName;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

public class PublishWithConcurrencyControlExample {
    public static void main(String... args) throws Exception {
        String arguments = String.join(",", args);
        System.out.printf("len %d args: %s%n", args.length, arguments);
        if (args.length < 2) {
            System.out.println("Usage: PublishWithConcurrencyControlExample <gcp proj id> <gcp topic id>");
            System.exit(1);
        }
        String projectId = args[0];
        String topicId = args[1];

        String credsPath = System.getenv("GOOGLE_APPLICATION_CREDENTIALS");
        System.out.printf("using creds: %s%n", credsPath);
        publishWithConcurrencyControlExample(projectId, topicId);
    }

    public static void publishWithConcurrencyControlExample(String projectId, String topicId)
            throws IOException, ExecutionException, InterruptedException {
        TopicName topicName = TopicName.of(projectId, topicId);
        Publisher publisher = null;
        List<ApiFuture<String>> messageIdFutures = new ArrayList<>();

        try {
            // Provides an executor service for processing messages. The default
            // `executorProvider` used by the publisher has a default thread count of
            // 5 * the number of processors available to the Java virtual machine.
            ExecutorProvider executorProvider =
                    InstantiatingExecutorProvider.newBuilder().setExecutorThreadCount(4).build();

            // `setExecutorProvider` configures an executor for the publisher.
            publisher = Publisher.newBuilder(topicName).setExecutorProvider(executorProvider).build();

            // schedule publishing one message at a time : messages get automatically batched
            for (int i = 0; i < 100; i++) {
                String message = "message " + i;
                ByteString data = ByteString.copyFromUtf8(message);
                PubsubMessage pubsubMessage = PubsubMessage.newBuilder().setData(data).build();

                // Once published, returns a server-assigned message id (unique within the topic)
                ApiFuture<String> messageIdFuture = publisher.publish(pubsubMessage);
                messageIdFutures.add(messageIdFuture);
            }
        } finally {
            System.out.printf("Publishing %d messages%n", messageIdFutures.size());
            // Wait on any pending publish requests.
            List<String> messageIds = ApiFutures.allAsList(messageIdFutures).get();

            System.out.println("Published " + messageIds.size() + " messages with concurrency control.");

            if (publisher != null) {
                // When finished with the publisher, shutdown to free up resources.
                publisher.shutdown();
                publisher.awaitTermination(1, TimeUnit.MINUTES);
            }
        }
    }
}