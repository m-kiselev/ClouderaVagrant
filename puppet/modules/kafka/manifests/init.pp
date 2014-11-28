# == Class kafka
# Installs Kafka package.
# Unless you need to explicitly set the version of the Kafka package you
# want, you probably don't need to include this class directly.
# Including just kafka::server to set up a Kafka Broker, or just
# kafka::mirror to set upa Kafka MirrorMaker service should suffice.
#
# == Parameters:
#
# $version   - Kafka package version number.  Set this
#              if you need to override the default
#              package version.  If you override this,
#              the version must be >= 0.8.  Default: installed.
class kafka(
    $version = $kafka::defaults::version
)
{
  
  group { 'kafka':
    ensure => present,
  }
  ->
  user {'kafka':
    ensure => present,
    gid => 'kafka';       
  }
  ->
  package { 'kafka':
        ensure => $version,
    }

  file { "/usr/bin/kafka-report-brokers-count.sh":
    mode  => '0755',
    owner => kafka,
    group => kafka,
    source => "puppet:///modules/kafka/kafka-report-brokers-count.sh"
  }

}
