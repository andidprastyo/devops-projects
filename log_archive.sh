LOG_DIR=$1
ARCHIVE_DIR=~/log_archives
TIME=$(date +%Y%m%d_%H%M%S)

mkdir -p $ARCHIVE_DIR

tar -czf $ARCHIVE_DIR/logs_archive_$TIME.tar.gz $LOG_DIR

echo "$(date) - archived $LOG_DIR" >> $ARCHIVE_DIR/archive.log
