while true
do
  act=$(systemctl is-active mongod)
  if [ "$act" = "active" ]; then
      sleep 2
      echo "mongo still running, is $act"
  fi

  if [ "$act" != "active" ]; then
      echo "mongo not running, is $act"
      sudo systemctl start mongod
      sleep 3
  fi
done

