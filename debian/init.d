#! /bin/sh
PATH="/sbin:/usr/sbin:/bin:/usr/bin"

test -x /usr/sbin/change-env || exit 0

case "$1" in
	start)
#		echo -n "Starting Mobile network environment: "
#  		change-env `current-env`
#		echo "done."
  		;;
	stop)
		echo "Stopping mobile network environment: "
  		change-env stand-alone
		echo "."
  		;;
	reload)
		echo "Reloading mobile network environment: "
		change-env `current-env`
		echo "done."
  		;;
	restart|force-reload)
		echo "Restarting mobile network environment: "
		$0 stop
		sleep 2
		change-env `previous-env`
		echo "done."
  		;;
	*)
  		echo "Usage: /etc/init.d/ntp {start|stop|restart|force-reload}"
  		exit 1
		;;
esac

exit 0
