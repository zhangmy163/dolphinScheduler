#!/bin/sh
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

workDir=`dirname $0`
workDir=`cd ${workDir};pwd`

source $workDir/../conf/config/run_config.conf
source $workDir/../conf/config/install_config.conf

cd $installPath/; sh bin/dolphinscheduler-daemon.sh stop master-server;

cd $installPath/; sh bin/dolphinscheduler-daemon.sh stop worker-server;
cd $installPath/; sh bin/dolphinscheduler-daemon.sh stop logger-server;

cd $installPath/; sh bin/dolphinscheduler-daemon.sh stop alert-server;

cd $installPath/; sh bin/dolphinscheduler-daemon.sh stop api-server;

