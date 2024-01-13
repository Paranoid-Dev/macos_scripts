#!/bin/bash
rsync --iconv=utf-8,utf-8-mac --info=progress2 -rh --checksum --stats -b --backup-dir='/Volumes/8tb_nas/MBP_backup/trash/' --suffix="."$(date +"%Y%m%d%H%M") --delete Documents/ /Volumes/8tb_nas/MBP_backup/documents/

rsync --iconv=utf-8,utf-8-mac --info=progress2 -rh --checksum --stats -b --backup-dir='/Volumes/8tb_nas/MBP_backup/trash/' --suffix="."$(date +"%Y%m%d%H%M") --delete Pictures/screenshots/ /Volumes/8tb_nas/MBP_backup/screenshots/

rsync --iconv=utf-8,utf-8-mac --info=progress2 -rh --checksum --stats -b --backup-dir='/Volumes/8tb_nas/MBP_backup/trash/' --suffix="."$(date +"%Y%m%d%H%M") --delete Developer/ /Volumes/8tb_nas/MBP_backup/developer/

rsync --iconv=utf-8,utf-8-mac --info=progress2 -rh --checksum --stats -b --backup-dir='/Volumes/8tb_nas/MBP_backup/trash/' --suffix="."$(date +"%Y%m%d%H%M") --delete Desktop/ /Volumes/8tb_nas/MBP_backup/desktop/

rsync --iconv=utf-8,utf-8-mac --info=progress2 -rh --checksum --stats -b --backup-dir='/Volumes/8tb_nas/MBP_backup/trash/' --suffix="."$(date +"%Y%m%d%H%M") --delete --include='~/' --include='*.sh' --exclude='*' ~/ /Volumes/8tb_nas/MBP_backup/scripts/
