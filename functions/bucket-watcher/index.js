// Imports the Google Cloud client library
const {PubSub} = require('@google-cloud/pubsub');

const topicName = 'dmk-topic'
// Creates a client; cache this for further use
const pubSubClient = new PubSub();

async function publishMessage(file) {
    if (!file) {
        return
    }
    const data = {
        bucket: file.bucket,
        file: file.name
    };
    const json = JSON.stringify(data);
    // Publishes the message as a string, e.g. "Hello, world!" or JSON.stringify(someObject)
    const dataBuffer = Buffer.from(json);
    console.log(`writing ${json} to ${topicName}`);
    const messageId = await pubSubClient.topic(topicName).publish(dataBuffer);
    console.log(`Message ${messageId} published.`);
}

/**
 * See, https://cloud.google.com/functions/docs/calling/storage
 * Generic background Cloud Function to be triggered by Cloud Storage.
 *
 * @param {object} file The Cloud Storage file metadata.
 * @param {object} context The event metadata.
 */
exports.gcsToPubSub = (file, context) => {
    console.log(`  Event: ${context.eventId}`);
    console.log(`  Event Type: ${context.eventType}`);
    console.log(`  Bucket: ${file.bucket}`);
    console.log(`  File: ${file.name}`);
    console.log(`  Metageneration: ${file.metageneration}`);
    console.log(`  Created: ${file.timeCreated}`);
    console.log(`  Updated: ${file.updated}`);

    publishMessage(file).catch(console.error);
};