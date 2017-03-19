ROOT="${PWD}"
OMS-REPOSITORIES=(
    'build'
    'frameworks/base'
    'frameworks/native'
    'packages/apps/Contacts'
    'packages/apps/ContactsCommon'
    'packages/apps/Dialer'
    'packages/apps/ExactCalculator'
    'packages/apps/PackageInstaller'
    'packages/apps/PhoneCommon'
    'packages/apps/Settings'
    'system/core'
    'system/sepolicy'
    'vendor/cm'
)

ANGLER-REPOSITORIES=(
    'kernel/huawei/angler'
)

for oms-repository in "${OMS-REPOSITORIES[@]}"; do
    cd "${ROOT}/${oms-repository}"
    git am --whitespace=nowarn --keep-cr "${ROOT}/vendor/extra/oms-patches/${oms-repository}"/*
    cd "${ROOT}"
done

for angler-repository in "${ANGLER-REPOSITORIES[@]}"; do
    cd "${ROOT}/${angler-repository}"
    git am --whitespace=nowarn --keep-cr "${ROOT}/vendor/extra/angler-patches/${angler-repository}"/*
    cd "${ROOT}"
done

