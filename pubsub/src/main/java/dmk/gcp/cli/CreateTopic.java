package dmk.gcp.cli;

import com.google.cloud.pubsub.v1.TopicAdminClient;
import com.google.pubsub.v1.Topic;
import com.google.pubsub.v1.TopicName;

import java.io.IOException;

public class CreateTopic {

    public static void main(String... args) throws Exception {
        String arguments = String.join(",", args);
        System.out.printf("len %d args: %s%n", args.length, arguments);
        if (args.length < 2) {
            System.out.println("Usage: PublishWithConcurrencyControlExample <gcp proj id> <gcp topic id>");
            System.exit(1);
        }
        String projectId = args[0];
        String topicId = args[1];

        createTopicExample(projectId, topicId);
    }

    public static void createTopicExample(String projectId, String topicId) throws IOException {
        try (TopicAdminClient topicAdminClient = TopicAdminClient.create()) {
            TopicName topicName = TopicName.of(projectId, topicId);
            Topic topic = topicAdminClient.createTopic(topicName);
            System.out.println("Created topic: " + topic.getName());
        }
    }
}