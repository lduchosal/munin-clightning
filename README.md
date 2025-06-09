
# Munin plugins for Bitcoin's c-lightning

## Installation & Configuration

1. Install jq as dependency

1. Link the `lightningd_*` scripts to `/etc/munin/plugins`.

1. If you're using SELinux, don't forget to `chcon` them properly.

1. Configure the plugins by creating a file named `/etc/munin/plugin-conf.d/bitcoind` with this content:

    ```
    [lightningd_*]
    user bitcoin
    ```

    This will tell Munin to run `lightning-cli` as the `bitcoin` user. Adapt it to your setup and avoid using `root`.

1. Restart the *munin-node* daemon with `systemctl restart munin-node` or `/etc/init.d/munin-node restart`.

1. Done. You should now start to see a new section *lightningd* in your Munin pages with the corresponding graphs.

1. After a while, images 

![Balance across various channels for a day](media/channels_balance_35a61099-day.png)
![Summary of channel status or performance over a day](media/channels-day.png)
![Informational metrics or logs for c-lightning for a day](media/clightning_info-day.png)
![Logs specifically related to c-lightning over a day](media/clightning_log-day.png)
![Acceptable fee rates per kilobyte for transactions for a day](media/feerates_perkb_acceptable-day.png)
![On-chain fee rates per kilobyte for a day](media/feerates_perkb_onchain-day.png)
![Overall fee rates per kilobyte for a day](media/feerates_perkb-day.png)
![Fee rates per kilowatt for a day](media/feerates_perkw-day.png)
![Amount of forwards for a particular day](media/forwards_amount-day.png)
![Fees incurred from forwards for a day](media/forwards_fees-day.png)
![Status or distribution of funds across channels for a day](media/funds_channels-day.png)
![Overall funds status or changes for a day](media/funds-day.png)
![Amount related to invoices for a day](media/invoices_amount-day.png)
![Summary or log of invoices for a day](media/invoices-day.png)
![Amount related to payments for a day](media/pays_amount-day.png)
![Summary or log of payments for a day](media/pays-day.png)
![Amount related to sent payments for a day](media/sendpays_amount-day.png)
![Summary or log of sent payments for a day](media/sendpays-day.png)

## License

AGPLv3+
