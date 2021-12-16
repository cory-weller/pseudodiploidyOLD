#!/usr/bin/env bash

# script to retrieve raw data set

# download SGD_features
if [[ ! -f data/external/SGD_features.tab ]]; then
    wget -O data/external/SGD_features.tab http://sgd-archive.yeastgenome.org/curation/chromosomal_feature/SGD_features.tab
else
    echo "SGD_features already downloaded"
fi
features_checksum=$(sha512sum data/external/SGD_features.tab | cut -d " " -f 1)
if [[ ${features_checksum} != "cc3c54abb0106993b4d09227f4748e46460b4a7614518b6513863d7c175d9e9bdde773a676729437f7c2cba622cc40c98dbc83bf38b84149e05aedf056639373" ]]; then
    echo "WARNING: SGD_features.tab checksum failed, contents may differ from those originally used"
else
    echo "SGD_features.tab checksum passed"
fi


# if [[ ! -f data/external/filename.txt ]]; then
#     wget -O data/external/filename.txt http://url-to-file/filename.txt
# else
#     echo "filename already downloaded"
# fi
