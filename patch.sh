ROOT="${PWD}"
OMSREPOSITORIES=(
    'build'
    'frameworks/base'
    'frameworks/native'
    'packages/apps/Contacts'
    'packages/apps/ContactsCommon'
    'packages/apps/Dialer'
    'packages/apps/ExactCalculator'
    'packages/apps/PhoneCommon'
    'packages/apps/Settings'
    'system/core'
    'system/sepolicy'
    'vendor/sm'
)

for omsrepository in "${OMSREPOSITORIES[@]}"; do
    cd "${ROOT}/${omsrepository}"
    git am --whitespace=nowarn --keep-cr "${ROOT}/vendor/extra/oms-patches/${omsrepository}"/*
    cd "${ROOT}"
done

