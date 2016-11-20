FROM kodbasen/buildpack-deps:curl

# procps is very common in build systems, and is a reasonably small package
RUN apt-get update && apt-get install -y --no-install-recommends \
		bzr \
		git \
		openssh-client \
                \
		procps \
	&& rm -rf /var/lib/apt/lists/*
