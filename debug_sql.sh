#!/bin/sh
# Debug script for munin-clightning SQL plugins

CLI="${cli:-cln}"

echo "=== PEERCHANNELS STATES ==="
$CLI sql "SELECT state, COUNT(*) as cnt FROM peerchannels GROUP BY state"

echo ""
echo "=== PEERCHANNELS SAMPLE (1 row) ==="
$CLI sql "SELECT state, peer_connected, to_us_msat, total_msat, spendable_msat, receivable_msat FROM peerchannels LIMIT 1"

echo ""
echo "=== CLOSEDCHANNELS CAUSES ==="
$CLI sql "SELECT close_cause, COUNT(*) as cnt FROM closedchannels GROUP BY close_cause"

echo ""
echo "=== CLOSEDCHANNELS OPENER/CLOSER ==="
$CLI sql "SELECT opener, closer, COUNT(*) as cnt FROM closedchannels GROUP BY opener, closer"

echo ""
echo "=== FORWARDS STATUS ==="
$CLI sql "SELECT status, COUNT(*) as cnt FROM forwards GROUP BY status"

echo ""
echo "=== FORWARDS SAMPLE (1 row) ==="
$CLI sql "SELECT status, fee_msat, in_msat, received_time FROM forwards WHERE status='settled' LIMIT 1"

echo ""
echo "=== PEERS STATUS ==="
$CLI sql "SELECT connected, COUNT(*) as cnt FROM peers GROUP BY connected"

echo ""
echo "=== SENDPAYS STATUS ==="
$CLI sql "SELECT status, COUNT(*) as cnt FROM sendpays GROUP BY status"

echo ""
echo "=== INVOICES STATUS ==="
$CLI sql "SELECT status, COUNT(*) as cnt FROM invoices GROUP BY status"

echo ""
echo "=== NETWORKEVENTS TYPES ==="
$CLI sql "SELECT type, COUNT(*) as cnt FROM networkevents GROUP BY type" 2>/dev/null || echo "(table may not exist)"

echo ""
echo "=== BKPR_INCOME TAGS ==="
$CLI sql "SELECT tag, COUNT(*) as cnt FROM bkpr_income GROUP BY tag" 2>/dev/null || echo "(bookkeeper not enabled)"

echo ""
echo "=== TABLE LIST ==="
$CLI sql "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name"
