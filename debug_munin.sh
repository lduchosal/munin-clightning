#!/bin/sh
# Debug script for munin-clightning SQL plugins
# Usage: sh debug_munin.sh [plugin_name]
# Example: sh debug_munin.sh lightningd_sql_channels_balance

OUTPUT_DIR="/tmp/munin-debug"
mkdir -p "$OUTPUT_DIR"

PLUGINS="
lightningd_sql_channels_balance
lightningd_sql_channels_health
lightningd_sql_forwards
lightningd_sql_payments
lightningd_sql_network
lightningd_sql_closedchannels
lightningd_sql_income
lightningd_clboss
"

run_debug() {
    plugin="$1"
    echo "=== $plugin ===" | tee -a "$OUTPUT_DIR/summary.txt"

    echo "--- munin-run $plugin (values) ---"
    munin-run "$plugin" 2>&1 | tee "$OUTPUT_DIR/${plugin}_values.txt"

    echo ""
    echo "--- munin-run $plugin config ---"
    munin-run "$plugin" config 2>&1 | tee "$OUTPUT_DIR/${plugin}_config.txt"

    echo ""
    echo "--- munin-run --debug $plugin ---"
    munin-run --debug "$plugin" 2>&1 | tee "$OUTPUT_DIR/${plugin}_debug.txt"

    echo ""
    echo "--- direct execution with debug ---"
    MUNIN_DEBUG=1 /usr/local/share/munin/plugins/munin-lightningd/"$plugin" debug 2>&1 | tee "$OUTPUT_DIR/${plugin}_direct.txt"

    echo ""
    echo "================================================"
    echo ""
}

# Header
echo "Munin Debug Run - $(date)" | tee "$OUTPUT_DIR/summary.txt"
echo "Output directory: $OUTPUT_DIR" | tee -a "$OUTPUT_DIR/summary.txt"
echo "" | tee -a "$OUTPUT_DIR/summary.txt"

if [ -n "$1" ]; then
    # Run specific plugin
    run_debug "$1"
else
    # Run all SQL plugins
    for plugin in $PLUGINS; do
        run_debug "$plugin"
    done
fi

echo ""
echo "Debug output saved to: $OUTPUT_DIR"
echo "To view: cat $OUTPUT_DIR/*_debug.txt"
