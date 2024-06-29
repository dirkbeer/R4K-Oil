function decodeUplink(input) {
    // Extract bytes from the input
    const bytes = input.bytes;

    // Extract temperature, humidity, and battery level parts from the bytes array
    const temp = bytes[0] / 4.0; // temperature in °C
    const humi = bytes[1] / 2.0; // humidity in %
    const batt_1 = bytes[2]; // first part of battery level
    const batt_2 = bytes[3]; // second part of battery level

    // Combine the two parts of the battery level to get the full value
    const batt = (batt_1 << 8) | batt_2; // battery level in mV

    // Return the decoded data
    return {
        temp: temp, // temperature in °C
        humi: humi, // humidity in %
        batt: batt  // battery level in mV
    };
}

function Decoder(bytes, port) {
    // Decode the input bytes using the decodeUplink function
    const input = { bytes: bytes };
    const decodedData = decodeUplink(input);

    return {
        data: decodedData
    };
}


/*

// test using `node --trace-uncaught test.js`

const sampleData = Buffer.from('FTjIEA==', 'base64');

const input = {
    bytes: Array.from(sampleData),
    fPort: 2,
    variables: {}
};

const resultChirpstack = decodeUplink(input);

console.log(resultChirpstack);

const resultHelium = Decoder(input.bytes, input.fPort);

console.log(resultHelium);

*/

