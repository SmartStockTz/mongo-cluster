# mongo-cluster

## Linux

1. Navigate `cd /opt`
2. Clone repository to folder name mongo `git clone https://github.com/SmartStockTz/mongo-cluster mongo`
3. Install mongodb from their website
4. Create root user for mongod
5. Copy `cp /opt/mongo/mongod.conf /etc/mongod.config` i.e update mongod configuration with this repository configuration.
6. Restart mongod instance

If its the first server then start a replica set, you can find documentation from mongod website the other server you repeate the procedure and you add that server to previous primary.

### Clean logs
run `cp /dev/null /var/log/mongod.log`

### dump db 
run `/usr/bin/mongodump --uri "mongodb://<the-rest-of-url>" --archive=bfastdata`

Tips
You can add clean and dump commands to crontab with `crontab -e`

### Mongod instance health

1. You can run a service to chech if mongod is running and if not force restart it.
2. Copy `sudo cp /opt/mongo/mongod-heart-beat.service /etc/systemd/system`
3. Enable service `sudo systemctl enable mongod-heart-beat.service`
4. Start the service `sudo systemctl start mongod-heart-beat.service`
5. 
