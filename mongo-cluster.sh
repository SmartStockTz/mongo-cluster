touch /var/log/mongod.log
chgrp mongodb /var/log/mongod.log
chown mongodb /var/log/mongod.log
chgrp mongodb -R /opt/mongo
chown mongodb -R /opt/mongo
chmod 400 /opt/mongo/mongo-keyfile
cp /opt/mongo/mongod.conf /etc/mongod.conf
chgrp mongodb /etc/mongod.conf
chown mongodb /etc/mongod.conf
cp /opt/mongo/mongod-heart-beat.service /etc/systemd/system
systemctl enable mongod-heart-beat.service
systemctl start mongod-heart-beat.service
systemctl stop mongod
systemctl start mongod

echo "mongod start, now setting clone jobs..."

crontab -l >myc
echo -e  "0 * * * * cp /dev/null /var/log/mongod.log \n* */3 * * * /usr/bin/mongodump --uri \"mongodb://fahamutechdb:fahamutechm0ng0db@1.mongo.fahamutech.com:27017,2.mongo.fahamutech.com:27017,3.mongo.fahamutech.com\" --archive=bfastdata" > myc
crontab myc
rm myc
echo "done"
