# Class: elasticsearch_reporter
# ===========================
#
# Full description of class elasticsearch_reporter here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'elasticsearch_reporter':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class elasticsearch_reporter (
  $es_host = '127.0.0.1',
  $es_port = 9200,
  $config_file   = $::elasticsearch_reporter::params::config_file,
  $config_owner  = $::elasticsearch_reporter::params::config_owner,
  $config_group  = $::elasticsearch_reporter::params::config_group,
  $es_index = $::elasticsearch_reporter::params::es_index,
  $es_type = $::elasticsearch_reporter::params::es_type,
) inherits elasticsearch_reporter::params {

file { $config_file:
    ensure  => file,
    owner   => $config_owner,
    group   => $config_group,
    mode    => '0444',
    content => template('elasticsearch_reporter/elasticsearch.yaml.erb'),
} ->

notify {"You might need to restart Puppet Server in order changes to be applied.":}

}
