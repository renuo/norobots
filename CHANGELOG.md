# Changelog

## 0.3.0

### Additions

- Added support for domain-based robots.txt configuration using `CANONICAL_HOST` environment variable.
- Added ability to use original robots.txt for canonical domain while blocking others.

### Changes

- Made `BLOCK_ROBOTS` and `CANONICAL_HOST` environment variables mutually exclusive.
- Updated Rails integration to insert middleware when either `BLOCK_ROBOTS` or `CANONICAL_HOST` is set.
- Updated README with new configuration options and examples.

##0.2.5

### Additions

- Add CI workflow 

##0.2.4

### Changes

- Linting changes

##0.2.3

### Changes

- Remove license year

##0.2.2

### Changes

- Update gemfile

##0.2.1

### Additions

- Add standardrb for development environment

### Removals

- Drop rubocop dependency for development environment


## 0.2.0

### Additions

- Initial release of the norobots gem, providing middleware for handling robots.txt in Rack applications. 
- Added middleware for blocking robots based on environment variable.
- Setup initial project structure and configuration.
- Added license to the gemspec.
- Created LICENSE file.
- Updated README with initial documentation.