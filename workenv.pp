zypprepo { "Packman Repository":
  enabled      => 1,
  autorefresh  => 1,
  baseurl      => 'http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_13.1/',
  type         => 'rpm-md',
  keeppackages => 0
}

zypprepo { "namtrac:subpixel":
  enabled      => 1,
  autorefresh  => 1,
  baseurl      => "http://download.opensuse.org/repositories/home:/namtrac:/subpixel/openSUSE_13.1/",
  type         => 'rpm-md',
  keeppackages => 0
}

zypprepo { "VirtualBox":
  enabled      => 1,
  autorefresh  => 1,
  baseurl      => "http://download.virtualbox.org/virtualbox/rpm/opensuse/12.3",
  type         => 'yum',
  keeppackages => 0,
  gpgcheck     => 1,
  gpgkey       => 'http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc',
  priority     => 120,
}

$base_pkgs = [
              'gcc',
              'make',
              'kernel-devel',
              ]
package { $base_pkgs: ensure => 'installed' }

$editors = [
            'emacs',
            'emacs-nox',
            'emacs-el',
            'emacs-info',
            ]
package { $editors: ensure => 'installed' }

$terminal_toolbox = [
                     'terminator',
                     'mc',
                     'htop',
                     'iftop',
                     'pv',
                     'pwgen',
                     'pixz',
                     'pbzip2',                     
                     ]
package { $terminal_toolbox: ensure => 'installed' }

##
# VMs and other environment handling
##
$vm_envs = [
            'VirtualBox-4.3',
            'lxc',
            'bridge-utils',
            'iputils',
            'screen',
            ]
package { 
  $vm_envs: ensure => 'installed' ,
  before => User['aphilipsenburg'],
  }

##
# Some eye candy
##
$looknfeel = [
              'adobe-sourcecodepro-fonts',
              'adobe-sourcesanspro-fonts',
              'faenza-icon-theme',
              'faenza-icon-theme-dark',
              'faenza-icon-theme-darker',
              'faenza-icon-theme-darkest',
              ]
package { $looknfeel: ensure => 'installed' }

##
# Dev tools
##
$devtools = [
             'git',
             'gitg',
             'mercurial',
             'subversion',
             'kdiff3',
             ]
package { $devtools: ensure => 'installed' }

##
# Programming environments
##
$devenvs = [
            'python',
            'python-virtualenvwrapper',
            ]
package { $devenvs: ensure => 'installed' }

##
# Communications
##
$comPkgs = [
            'MozillaThunderbird',
            'enigmail',
            'pidgin',
            'pidgin-otr',
            'pidgin-plugin-pack',
            'pidgin-plugin-pack-extras',        
           ]
##
# Trashcan. Stuff that's installed, but we don't want.
##
$trashPkgs = [
             'rhythmbox',
             'evolution',
             'empathy',
             'libzeitgeist-2_0-0',          
             ]

user { "aphilipsenburg":
  ensure     => 'present',
  forcelocal => true,
  groups     => [
                 'disk',
                 'vboxsf',
                 'vboxusers',
                 'users',
                 'video',
                 'audio',
                 'cdrom',
                 'lp',
                 'trusted',
                 ],
}
