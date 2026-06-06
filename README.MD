# Server Performance & Metrics Dashboard

A lightweight, high-efficiency Bash script that captures and displays real-time server performance statistics. It consolidates multiple system metrics—CPU usage, memory allocation, disk space, and resource-heavy processes—into a single, human-readable terminal dashboard.

## 📊 Dashboard Preview

```text
----- Server Performance Stats -----
Total CPU Usage: 1.2%
Free Memory:     3326.7 MiB
Used Memory:     481.7 MiB
Total Disk:      955.64G
Free Disk:       953.97G
Used Disk:       1.67G

----- Top 5 Processes by CPU Usage -----
USER         PID      %CPU     COMMAND             
redis        308      0.8      /usr/bin/redis-server
root         1        0.0      /sbin/init          

----- Top 5 Processes by Memory Usage -----
USER         PID      %MEM     COMMAND             
redis        308      2.4      /usr/bin/redis-server
```

## 🛠️ Installation & Setup

1. **Save the Script**: Put your code into a file named `server-stats.sh`.
2. **Make it Executable**: Give the system permission to run the script by execution formatting:
   ```bash
   chmod +x server-stats.sh
   ```

## 💻 Usage

To execute the script, run:
```bash
./server-stats.sh
```

### Automation (Optional)
To log these metrics straight into a text archive file every hour for analysis, add it to your `crontab`:

1. Open the cron editor:
   ```bash
   crontab -e
   ```
2. Paste this line at the bottom of the file (creates a log file in your home directory):
   ```text
   0 * * * * /<home path>/server-stats.sh >> /<home path>/server-metrics.log 2>&1
   ```

## 📋 Dependencies

The script utilizes standard native Linux binary toolsets. No external package installation is required:
* `bash`
* `awk`
* `top`
* `df`
* `ps`
