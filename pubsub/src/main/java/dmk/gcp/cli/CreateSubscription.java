package dmk.gcp.cli;

import com.google.cloud.pubsub.v1.SubscriptionAdminClient;
import com.google.pubsub.v1.PushConfig;
import com.google.pubsub.v1.Subscription;

import java.io.IOException;

public class CreateSubscription {

    public static void main(String... args) throws Exception {
        String arguments = String.join(",", args);
        System.out.printf("len %d args: %s%n", args.length, arguments);
        if (args.length < 2) {
            System.out.println("Usage: CreateSubscription <gcp proj id> <gcp topic> <gcp subscription>");
            System.exit(1);
        }
        String projectId = args[0];
        String topic = args[1];
        String subscription = args[2];
        String credsPath = System.getenv("GOOGLE_APPLICATION_CREDENTIALS");
        System.out.printf("using creds: %s%n", credsPath);

        createSubscription(projectId, topic, subscription);
    }

    public static void createSubscription(String projectId, String topic, String subscriptionName) throws IOException {
        try (SubscriptionAdminClient client = SubscriptionAdminClient.create()) {
            PushConfig config = PushConfig.getDefaultInstance();
            Subscription subscription = client.createSubscription(subscriptionName, topic, config, 30);
            System.out.println("Created subscription: " + subscription.getName());
        }
    }

}