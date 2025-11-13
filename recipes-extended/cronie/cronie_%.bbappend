do_install:append:sota() {
    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        install -d ${D}${sysconfdir}/tmpfiles.d
        echo "d /var/spool/cron 0770 root crontab -" > ${D}${sysconfdir}/tmpfiles.d/cronie.conf
        # Remove pre-created /var directory from package
        rmdir ${D}${localstatedir}/spool/cron || true
        rmdir ${D}${localstatedir}/spool || true
        rmdir ${D}${localstatedir} || true
    fi
}
