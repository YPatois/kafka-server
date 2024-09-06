#!/bin/bash -x

# prepare
# yum install rpm-build -y
# yum install rpmdevtools -y

# build on current directory
# rpmbuild -ba SPECS/kafka.spec --define="_topdir `pwd`"

#spectool -g SPECS/kafka.spec
#mv kafka*-src.tgz SOURCES
#rpmbuild -bs --nodeps --define "_sourcedir $(pwd)/SOURCES" --define "_srcrpmdir $(pwd)" SPECS/#kafka.spec

#mv kafka*src.rpm $(pwd)/SOURCES/
#mock --enable-network kafka*.src.rpm

#exit 0
#rm -rf build
# def
export TOPDIR=$(pwd)/build/rpmbuild
#rpmdev-setuptree --define "_rpmdir $TOPDIR"

# make TOPDIR
mkdir -p ${TOPDIR}

# copy SPECS to TOPDIR
cp -rf SPECS ${TOPDIR}
# copy SOURCES to TOPDIR
cp -rf SOURCES ${TOPDIR}

# build
spectool -C ${TOPDIR}/SOURCES -g ${TOPDIR}/SPECS/kafka.spec

# Direct
#rpmbuild --define "_topdir $TOPDIR" -ba ${TOPDIR}/SPECS/kafka.spec

# mock
rpmbuild -bs --nodeps --define "_topdir $TOPDIR" ${TOPDIR}/SPECS/kafka.spec
mock --enable-network $TOPDIR/SRPMS/kafka*.src.rpm
