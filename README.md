# Gershwin Developer

This repository automates the installation of GNUstep developer tools on Debian, utilizing submodules for a streamlined setup.

### Requirements

[Gershwin System](https://github.com/gershwin-os/system.git)

## Components Included

- **apps-gorm**: Gorm - Interface Builder for GNUstep
- **apps-projectcenter**: Project Center - Integrated Development Environment (IDE) for GNUstep

## Installation Paths (NETWORK domain)

The components are installed into directories under the NETWORK domain, organized in a hierarchical structure that mimics the developer environment found in original Mac OS X versions:

- **Applications**: `/Developer/Applications`
- **Admin Applications**: `/Developer/Applications`
- **Web Applications**: `/Developer/WebApplications`
- **Tools**: `/Developer/bin`
- **Admin Tools**: `/Developer/sbin`
- **Library**: `/Developer/Library`
- **Headers**: `/Developer/Headers`
- **Libraries**: `/Developer/Libraries`
- **Documentation**: `/Developer/Documentation`
- **Man Pages**: `/Developer/Documentation/man`
- **Info Pages**: `/Developer/Documentation/info`

## Usage (Debian)

Follow these steps to set up Gershwin System on Debian:

1. Clone the repository with submodules:

```
git clone https://github.com/gershwin-os/developer.git --recurse-submodules
```

2. Source GNUstep.sh:
```
. /Developer/Makefiles/GNUstep.sh 
```

3. Build the components:
```
cd developer && sudo ./build.sh
```

4. Launch GWorkspace:
```
openapp GWorkspace
```