FROM ddrown/android-cross-compile
MAINTAINER Paul Maddox <paul@sonelli.com>

ADD bash-android.patch /home/admin/
ADD build /home/admin/
RUN chmod 755 /home/admin/build
RUN mkdir /target

CMD /home/admin/build