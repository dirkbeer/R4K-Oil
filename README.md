# R4K-Oil

LoRaWAN Oil tank level sensor

## Bill of Materials

[RAK19003](https://store.rakwireless.com/products/wisblock-base-board-rak19003)

[RAK4631](https://store.rakwireless.com/products/rak4631-lpwan-node)

[RAK1901](https://store.rakwireless.com/products/rak1901-shtc3-temperature-humidity-sensor)

[HC-SR04 Ultrasonic Sensor](https://www.sparkfun.com/products/15569)

[Pololu 5V Step-Up Voltage Regulator](https://www.pololu.com/product/2562)

## AT Commands to set up the device
```
ATR
ATZ

```
```
AT+DEVEUI=7ef41e54390778ce
AT+APPEUI=9c07bf8e44cd98d1
AT+APPKEY=ae37f9b2b5e11967f832d357d799ffa3
AT+BAND=8
AT+MASK=2
AT+DR=3
AT+ADR=1
AT+SENDINT=120
AT+JOIN=1:1:8:10
ATZ

```