FROM gitpod/workspace-full
ENV JAVA_HOME=/home/gitpod/.sdkman/candidates/java/current
RUN curl -fLo cs https://git.io/coursier-cli-"$(uname | tr LD ld)" \
    && chmod +x cs \
    && eval "$(./cs setup --env)" \
    && ./cs install --only-prebuilt=true bloop \
    && rm cs \
    && echo 'export PATH="$PATH:/home/gitpod/.local/share/coursier/bin"' >> ~/.bashrc
ENV SBT_OPTS="-Dsbt.global.base=/workspace/.sbt -Dsbt.coursier.home=/workspace/.coursier -Dsbt.ivy.home=/workspace/.ivy2"
ENV COURSIER_CACHE="/workspace/.coursier"
RUN echo alias "initMetals='mv .cache/coursier/v1/ /workspace/.coursier && mkdir -p /workspace/.sbt/plugins/ && echo "'addSbtPlugin\\(\\"ch.epfl.scala\\" % \\"sbt-bloop\\" % \\"1.4.8\\"\\)'" > /workspace/.sbt/plugins/metals.sbt && sbt -Dbloop.export-jar-classifiers=sources bloopInstall +Test/compile'" >> .bashrc
