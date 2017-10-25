FROM base/archlinux:latest 
RUN echo -e '[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/$arch\n' >> /etc/pacman.conf &&\
    pacman -Syu --noconfirm &&\
    pacman -S --noconfirm yaourt sudo fakeroot vi &&\
    useradd noxbit && usermod -aG wheel noxbit &&\
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers
USER noxbit
RUN /usr/sbin/yaourt -S --noconfirm noxbit
USER root
RUN rm /var/cache/pacman/pkg/*
EXPOSE 6689 6881 6882 6883 6884 6885 6886 6887 6888 6889 6890 6891 6892 6893 6894 6895 6896 6897 6898 6899 6900
VOLUME /config
VOLUME /var/log
COPY root/init.sh /opt/noxbit/
ENTRYPOINT ["/opt/noxbit/init.sh"]
