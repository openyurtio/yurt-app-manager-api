#!/usr/bin/env bash

set -x
set -e

YURT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"

TMP_DIR=$(mktemp -d)
mkdir -p ${TMP_DIR}/src/github.com/openyurtio/yurt-app-manager-api
cp -r ${YURT_ROOT}/* ${TMP_DIR}/src/github.com/openyurtio/yurt-app-manager-api

(
  cd ${TMP_DIR}/src/github.com/openyurtio/yurt-app-manager-api/;
  HOLD_GO="${TMP_DIR}/src/github.com/openyurtio/yurt-app-manager-api/hack/hold.go"
  printf 'package hack\nimport "k8s.io/code-generator"\n' > ${HOLD_GO}
  go mod vendor
  GOPATH=${TMP_DIR} GO111MODULE=off /bin/bash vendor/k8s.io/code-generator/generate-groups.sh all \
    github.com/openyurtio/yurt-app-manager-api/pkg/yurtappmanager/client github.com/openyurtio/yurt-app-manager-api/pkg/yurtappmanager/apis apps:v1alpha1 -h ./hack/boilerplate.go.txt
)

rm -rf ./pkg/yurtappmanager/client/{clientset,informers,listers}
mv "${TMP_DIR}/src/github.com/openyurtio/yurt-app-manager-api/pkg/yurtappmanager/client" ./pkg/yurtappmanager/
echo "code generate finished."
