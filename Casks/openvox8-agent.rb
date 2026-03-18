cask 'openvox8-agent' do
  arch arm: 'arm64', intel: 'x86_64'

  on_ventura :or_newer do
    on_arm do
      version "8.25.0"
      sha256  "de3096dce5e4a13392717d3423d000209c4550a4067ce3b62f2ec6c69a5da0c3"
    end
    on_intel do
      version "8.25.0"
      sha256  "3267660f1bba0b069ead729ba7a957ab149a8542a229b9ee392b81b808ff58e1"
    end
  end

  depends_on macos: '>= :ventura'

  url "https://downloads.voxpupuli.org/mac/openvox8/openvox-agent-#{version}-1.macos.all.#{arch}.dmg"
  pkg "openvox-agent-#{version}-1-installer.pkg"

  name 'OpenVox Agent'
  homepage "https://voxpupuli.org/openvox/"

  conflicts_with cask: [
    "openvox-agent-8",
    "puppet-agent-8",
    "puppet-agent-7",
    "puppet-agent-6",
    "puppet-agent-5",
    "puppet-agent",
  ]

  uninstall launchctl: [
                         'puppet',
                         'pxp-agent',
                       ],
            pkgutil:   'org.voxpupuli.openvox-agent'

  zap trash: [
               '~/.puppetlabs',
               '/etc/puppetlabs',
             ]
end
