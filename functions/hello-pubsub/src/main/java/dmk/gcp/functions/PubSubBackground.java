package dmk.gcp.functions;

import com.google.cloud.functions.BackgroundFunction;
import com.google.cloud.functions.Context;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import java.util.Base64;
import java.util.Map;
import java.util.logging.Logger;

import static java.nio.charset.StandardCharsets.UTF_8;

public class PubSubBackground implements BackgroundFunction<PubSubBackground.PubSubMessage> {
    private static final Logger logger =
            Logger.getLogger(PubSubBackground.class.getName());

    @Override
    public void accept(PubSubMessage message, Context context) {
        if (message == null) {
            return;
        }
        logger.info("Received message with id " + message.messageId);
        logger.info(message.toString());
        if (message.getData() != null) {
            String data = new String(
                    Base64.getDecoder().decode(message.getData().getBytes(UTF_8)),
                    UTF_8);
            logger.info(data);
        }
    }

    public static class PubSubMessage {
        // Cloud Functions uses GSON to populate this object.
        // Field types/names are specified by Cloud Functions
        // Changing them may break your code!
        public String data;
        public Map<String, String> attributes;
        public String messageId;
        public String publishTime;


        public String getData() {
            return data;
        }

        public void setData(String data) {
            this.data = data;
        }

        public Map<String, String> getAttributes() {
            return attributes;
        }

        public void setAttributes(Map<String, String> attributes) {
            this.attributes = attributes;
        }

        public String getMessageId() {
            return messageId;
        }

        public void setMessageId(String messageId) {
            this.messageId = messageId;
        }

        public String getPublishTime() {
            return publishTime;
        }

        public void setPublishTime(String publishTime) {
            this.publishTime = publishTime;
        }

        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }
    }
}
