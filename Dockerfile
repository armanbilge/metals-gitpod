FROM gitpod/workspace-full
RUN brew install sbt \
    && brew reinstall sbt \
    && brew cleanup
RUN echo "-Dsbt.coursier.home=/workspace/.coursier" >> /home/linuxbrew/.linuxbrew/etc/sbtopts \
    && echo "-Dsbt.global.base=/workspace/.sbt" >> /home/linuxbrew/.linuxbrew/etc/sbtopts \
    && echo "-Dsbt.ivy.home=/workspace/.ivy2" >> /home/linuxbrew/.linuxbrew/etc/sbtopts \
    && echo alias "initMetals='mkdir -p /workspace/.sbt/1.0/plugins/ && echo "'addSbtPlugin\\("ch.epfl.scala" % "sbt-bloop" % "1.4.8"\\)'" > /workspace/.sbt/1.0/plugins/metals.sbt && sbt -Dbloop.export-jar-classifiers=sources bloopInstall +Test/compile'" >> .bashrc
