#! /bin/sh
PATH="/sbin:/usr/sbin:/bin:/usr/bin"

test -x /usr/sbin/nenv-change || exit 0

case "$1" in
	start)
#		echo -n "Starting Mobile network environment: "
#  		nenv-change `nenv-current`
#		echo "done."
  		;;
	stop)
		echo "Stopping mobile network environment: "
  		nenv-change stand-alone
		echo "."
  		;;
	reload)
		echo "Reloading mobile network environment: "
		nenv-change `nenv-current`
		echo "done."
  		;;
	restart|force-reload)
		echo "Restarting mobile network environment: "
		$0 stop
		sleep 2
		nenv-change `nenv-previous`
		echo "done."
  		;;
	*)
  		echo "Usage: $0 {start|stop|restart|force-reload}"
  		exit 1
		;;
esac

exit 0
