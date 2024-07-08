/* eslint-disable linebreak-style */
// eslint-disable-next-line
/* eslint-env node */
/* eslint-disable */
/* eslint-disable-next-line */
/* global require */
// const functions = require("firebase-functions");
// const admin = require("firebase-admin");
// const {setGlobalOptions} = require("firebase-functions/v2");
// setGlobalOptions({maxInstances: 10});
// admin.initializeApp();
const functions = require('firebase-functions');
const admin = require('firebase-admin');
const twilio = require('twilio');
const logger = require("firebase-functions/logger")


admin.initializeApp();

const twilioAccountSid = 'AC25c263834dd33dc7d3ae48fa0dfe57b4';
const twilioAuthToken = 'a6a6452483d2a3ac223f787898cf4ed3';
const twilioPhoneNumber = '+13127560243';

const client = new twilio.Twilio(twilioAccountSid, twilioAuthToken);

exports.sendTwilioMessage = functions.firestore.document('parking_ticket/{id}')
    .onWrite((change, context) => {
        // Check if the document was created or updated
        logger.info("send twilio message function called");
        // if (!change.before.exists || !change.after.exists) {
        //     logger.info("if condition failed");
        //     return null;
        // }

        // Get the phone number from the Firestore document
        const phoneNumber = change.after.data()["phone_number"];
        const numberPlate = change.after.data()["number_plate"];
        const locationLink = change.after.data()["drop_location"];// change drop_location to tow_location

        logger.info("This is : ", phoneNumber);
        logger.info("This is : ", numberPlate);
        logger.info("This is : ", locationLink);

        // Check if phone number exists
        if (!phoneNumber) {
            logger.info('Phone number not found in the document.');
            return null;
        }
        // Compose the message you want to send
        const message = `Hello, proud owner of: ${numberPlate}. \nSince your two wheel was parked in a no parking area, we have towed it. \nHere the location for your towed vechicle: ${locationLink}`;
        // Send message using Twilio
        return client.messages.create({
            body: message,
            from: twilioPhoneNumber,
            to: phoneNumber,
        })
        .then((message) => logger.info(`Message sent to ${phoneNumber}. Message SID: ${message.sid}` ))
        .catch((error) => logger.info(`Error sending message: ${error.message}`));
    });

