PERCONA_TOOLKIT_VERSION=3.0.4;

function version_test()
{
    local VERSION=$(docker run -it brunoric/percona-toolkit:3.0.4 pt-query-digest --version)
    if [[ $VERSION == *"${PERCONA_TOOLKIT_VERSION}"* ]]; then
        echo 'Version test OK!'; 
    else
        echo 'Version test Failed!'; 
        exit 1;
    fi
}

version_test;