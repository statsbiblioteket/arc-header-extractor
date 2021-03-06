#!/bin/sh

###
# #%L
# ARC Header Extractor
# %%
# Copyright (C) 2013 State and University Library, Denmark
# %%
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#      http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# #L%
###
ProgDir=`dirname "$0"`
. "${ProgDir}/env.sh"

if [ $# -lt 2 ]; then
  echo "Usage: `basename $0` {input} {output}"
    echo "{input} ARC file or directory of ARC files"
    echo "{output} output directory"
    exit 2
fi


if [ -z "${JAVA_DEBUG_OPTS}" ]; then
  JAVA_DEBUG_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=1044"
fi

if [ -z "${JAVA_OPTS}" ]; then
  JAVA_OPTS="-Xms256m -Xmx1024m -XX:PermSize=64M -XX:MaxPermSize=256M"
fi

"${JAVA}" ${JAVA_DEBUG_OPTS} ${JAVA_OPTS} -cp "$CP" dk.statsbiblioteket.archeaderextractor.HeaderExtractorCLI $@
