#include <stdint.h>

// Thomas Wang's integer hash functions. See <https://gist.github.com/lh3/59882d6b96166dfc3d8d> for a snapshot.
uint64_t hash_64(uint64_t key, uint64_t mask);

// The inversion of hash_64(). Modified from <https://naml.us/blog/tag/invertible>
uint64_t hash_64i(uint64_t key, uint64_t mask);