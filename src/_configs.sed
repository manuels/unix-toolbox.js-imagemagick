s/^#undef  *\([ABCDEFGHIJKLMNOPQRSTUVWXYZ_]\)/#undef MAGICKCORE_\1/
s/^#undef  *\([abcdefghijklmnopqrstuvwxyz]\)/#undef _magickcore_\1/
s/^#define  *\([ABCDEFGHIJKLMNOPQRSTUVWXYZ_][abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_]*\)\(.*\)/#ifndef MAGICKCORE_\1\
#define MAGICKCORE_\1\2\
#endif/
s/^#define  *\([abcdefghijklmnopqrstuvwxyz][abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_]*\)\(.*\)/#ifndef _magickcore_\1\
#define _magickcore_\1\2\
#endif/
