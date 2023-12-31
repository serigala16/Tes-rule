#!/data/data/com.termux/files/usr/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'anime.sh' encrypted at Wed Nov 15 01:20:13 WIB 2023
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=76
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SY�� ��u8`@���?�������( �� `�o�y�wiפ�ݭ�h��6Ԩ:�]��E�\�H�F L�L�悞�=O#Sb���S�4��S&G� (�d�Rzi��i����� G��� C@�I�징F&#'�4Ѧ��    i�  �S��yG�P �   4  ~� � �����@� 4C@ � $��1&L��12i��O&�����<���Q��@4� Z���6�o7�k����N�9���R��ջ4Q���?'$�{4��k�֯��X�1s�/ ���봴�� �}�d6P��{%�P��wܨG��J��Q6ʃYh�J�E���z�'dˀ�����X�3]o�Ű�񯡆�~�EK�>�Z��y��*[�>gQ��z>�t��b�J�\�M�BG F�U���Lxn����Aslm_��;��i%8���M���$jo��HP��!3]�6����aY�>ެ6��5�Z���5�]���#����ѐC~Sz�4kF���[J�!.���n�]��V)� $��[�T�ߓ��!�&��Nf!�B.G7�J�z�w4J���.\���X�!��5�%��)enC"�v�w6D�֙��pE�X�>0�X�\�94��B��$�}�<�o��f�;���i<�v�q^����h�m&�$I�,�c5j�ғ��G)��hJҴ��ia^4��5K �ob��^���Y���Q�v� ��R,.������8��O�h����������3�R��9$7�����o�Qv�V's@���G �p�U���1�F8���g������87pW9r.};����%���A'��3�W�S�໺�X��m� ��f,�dTV,�E�N`ŝe��>��=D���`����
�����k#����է
k&�c�rG�$���ǎ~���M�.��w�.��c�鳭�B�N���~��m��
�6�LX������@�xd#&�R���0T�7:��_o���<�C��b�Z*jC%)H��(�:�2<͌c�?\�
�6��T0b/{?w70�3��d0Xb��3�N�t��!���[^�o��Z'
��)k���NS���L@EJ����6_[�J~1��0��O�]0@��)W�Ur�Q�8���,�:�t���j�WK��d-D'A�Uy�Z8�fNnLY��S�4DC�h��:����F7(���2��=��=t'0q0��1�zɱ˱�i���9�pz��5#�R_(�ۀ�,Nl��[�c�3D���E�h�誘ZE�Z�(6����L]�&�0M0۔7�����
�r�-��j#�*�ŢLA�`��^��{*q`%m
��E�ـ�整�$�t�D�/;�ӌ{'���/:g��u���|_��!v�xw\�(�[��������R\b;�%�߃�'K�] ]�7�܎��|��j��ck_-��䇋K�}�&���f�o�oK|���X/CJ��H�� ���#ڲ{l��S���t�"MSE�f^����U�1X���4�=�H�/+$.q�:�Ѧ�~��ԸFZU�p�|NRQ�23�^�Ϥ�b�U��~�\�]�N,�#�v{��j��1�W�ʑ��\6� fpf�y54#�v�T�`���X�Y�� V�_��r��4a��U��G7ت�b#��cX,�������	qB$�`]�
�a�Y]�rZ7�t�T!��&d�u�(ˣ+�[��D^�@�J�0a�A��XA^��+Q�'ɸ�r��h㪊%��7>��i��=ޝRG���0��|L`0祿��E�L�R�s����}L��^S��=<Dk1��pɚ�����UWX���+��s��2GY�f$A��$y�BTC��&V��$:i{��%�ov3�� Х����=#V��i؛/��lG(�+���n��	*WʜE�+؂�$<!��{��v��*�7��X�O).����L4m�h�m3%F`3]+ �� ڂl]�@OY����z��!cC˘���W|�my����u�&_�3���Z턂불:BS>}�7���B�tf�8�|ȯ)��و�/�|��x!�)h�QnW�@2[��/
�u@۾�l�a^��u����b-@0 �4R�XI�����^�h�>0鏬h�C��b0��]���RrH�EB~�U'I���zǡW�c�L����tB�18M�����8cM ���H��U��=�2*����r��Az� �[�3P ���Y~������R���ԣ�߮�*��qID��o~�Omf��$��5L�H'�%�ȝ��˰	A��7-O}�C,x��A��~�.
��]�$BIYO��|��:*����)���#�%�#�mr��P���Bޅr�t���X��J� ��ah�P���ز�l�pƍ�$!Va���[��N��Y���vow~��U,�%�n�u��vJ��@��`�e3!P�lѐ��Z��E��T+��X ,��E+�������ƀ��R�$V��>~�g"f� �V!�,V�y3Ba�M��@�>D{|�{`3N}Zv&�[�`��c7ɮ���1�JL��pM�i�Li0a�S�u���9��J*5��UQ��W�
8���f��US��`�W���y�&쬊�)H5�I*��Cm�w�-�5`���B�o ��$
����a��_7 ����"E�@�r[:�$(�D$y�0�%B����cQ%�p|hUUt�ͻٗ
I<q��b%�0L�ة��������[O��2G3��p�:ç�Ի��^N���J8�SS���	w��"�R00�-Z��򬫟".pm�EjS�! �8��d��+� ��46�o�&��h�i6+�Is���@�2�m7 [��Z$�
a�[�Fy1g.Յͣ��'(w���j�Õs��c:�Zɨ��#&^����*0F'����B4�-���^�ׯn4�'m��
� ����������)p��l^'k}�F8^�2l��³�,"hB��7u�����Xz2�'Z �Q��i:5����V[
���J�RRoM��JW)�O��
���:am�$���X���ݝ�h�M 8)h�z�y��IƗc[� �����u�a�K{0�`3�qkqW.h�F��װ�F�16ɜB7�'�E�Xx4���>"�n��Ǿt�.�9�y� ��H�YCW@�(nt���,�@��ֈjt�j��Y� 0��ի�_�X���#�.�z
�@��$|�c��IoEq�B�
њ���r������ 8�G!���Yc���q�^�ċB5?�_��$� �2B^D����� . ">�^�I6i*Ѵ�փB�
Ԁ"	U
��U�V���I
��H%(*�Q�iv�����#%R+:����3��C���"��[E(�	KDV��CP���w$S�		�_� 