#!/usr/bin/env bash

# script to retrieve raw data set


getData () {
    filePath=${1}
    fileURL=${2}
    fileSHA512=${3}

    if [[ ! -f ${filePath} ]]; then
        wget -O ${filePath} ${fileURL}
    else
        echo "${filePath} already downloaded"
    fi
    checksum=$(sha512sum ${filePath} | cut -d " " -f 1)
    if [[ ${checksum} != "${fileSHA512}" ]]; then
        echo "WARNING: ${filePath} checksum failed, contents may differ from those originally used"
    else
        echo "${filePath} checksum passed"
    fi
}

getData \
    "data/external/SGD_features.tab" \
    "http://sgd-archive.yeastgenome.org/curation/chromosomal_feature/SGD_features.tab" \
    "cc3c54abb0106993b4d09227f4748e46460b4a7614518b6513863d7c175d9e9bdde773a676729437f7c2cba622cc40c98dbc83bf38b84149e05aedf056639373"

getData \
    "src/R.sif" \
    "https://onedrive.live.com/download?cid=77DD71E598E5B51B&resid=77DD71E598E5B51B%2119110&authkey=AH7s36_oIlV8uIU" \
    "7153e1498b86983ac83057d0dd7c7563b5fd67ad4aec2d348b23004c3e1733cc17a46a2ef02e076c315ba72594b8c9678f1ce657ac031d534a8ff53da5b89af6"
