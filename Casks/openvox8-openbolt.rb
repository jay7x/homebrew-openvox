cask 'openvox8-openbolt' do
  arch arm: 'arm64', intel: 'x86_64'

  on_ventura :or_newer do
    on_arm do
      version "5.4.0"
      sha256  "2880215c102cf5bea1bbc5e788ff7d0f598bae9d81f414f4735999f8f176be5f"
    end
    on_intel do
      version "5.4.0"
      sha256  "1e0ba22b1fbeba6966e828165b1f344e1aa0028f7b9f4512ddaa7f8c87db6ea4"
    end
  end

  depends_on macos: '>= :ventura'

  url "https://downloads.voxpupuli.org/mac/openvox8/openbolt-#{version}-1.macos.all.#{arch}.dmg"
  pkg "openbolt-#{version}-1-installer.pkg"

  name 'OpenVox Openbolt'
  homepage "https://voxpupuli.org/openvox/"

  conflicts_with cask: "puppet-bolt"

  uninstall pkgutil: 'org.voxpupuli.openbolt'
end
