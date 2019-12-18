#!/usr/bin/env bats

# Load bats modules
load '/usr/lib/bats-support/load.bash'
load '/usr/lib/bats-assert/load.bash'

@test "version" {
    MDADMCMD="tests/mock/mdadm" CONFIG="tests/sup/update-mdraid-cache.cfg" run usr/sbin/update-mdraid-cache --version
    assert_success
}

@test "help" {
    MDADMCMD="tests/mock/mdadm" CONFIG="tests/sup/update-mdraid-cache.cfg" run usr/sbin/update-mdraid-cache --help
    assert_success
}

@test "update" {
    rm -rf /tmp/tests
    
    MDADMCMD="tests/mock/mdadm" CONFIG="tests/sup/update-mdraid-cache.cfg" run usr/sbin/update-mdraid-cache

    assert_success
    
    fs="md1_mdinfo md2_mdinfo"
    for f in ${fs}; do
        run diff -u "/tmp/tests/snmpd-mdadm-connector/dev_${f}" "tests/sup/dev_${f}"
        assert_success
    done
    
    MDADMCMD="tests/mock/mdadm" CONFIG="tests/sup/update-mdraid-cache.cfg" run usr/sbin/update-mdraid-cache

    assert_success
    
    fs="md1_mdinfo md2_mdinfo"
    for f in ${fs}; do
        run diff -u "/tmp/tests/snmpd-mdadm-connector/dev_${f}" "tests/sup/dev_${f}"
        assert_success
    done

    rm -rf /tmp/tests
}
   