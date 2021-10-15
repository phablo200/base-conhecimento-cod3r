PGDMP         9                y         	   knowledge #   12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)     13.4 (Ubuntu 13.4-1.pgdg20.04+1) +    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16386 	   knowledge    DATABASE     ^   CREATE DATABASE knowledge WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'pt_BR.UTF-8';
    DROP DATABASE knowledge;
                postgres    false            �            1259    16432    articles    TABLE       CREATE TABLE public.articles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(1000) NOT NULL,
    "imageUrl" character varying(1000),
    content bytea NOT NULL,
    "userId" integer,
    "categoryId" integer NOT NULL
);
    DROP TABLE public.articles;
       public         heap    postgres    false            �            1259    16430    articles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.articles_id_seq;
       public          postgres    false    211            �           0    0    articles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;
          public          postgres    false    210            �            1259    16419 
   categories    TABLE     ~   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "parentId" integer
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    16417    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    209            �           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    208            �            1259    16389    knex_migrations    TABLE     �   CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);
 #   DROP TABLE public.knex_migrations;
       public         heap    postgres    false            �            1259    16387    knex_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.knex_migrations_id_seq;
       public          postgres    false    203            �           0    0    knex_migrations_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;
          public          postgres    false    202            �            1259    16397    knex_migrations_lock    TABLE     `   CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);
 (   DROP TABLE public.knex_migrations_lock;
       public         heap    postgres    false            �            1259    16395    knex_migrations_lock_index_seq    SEQUENCE     �   CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.knex_migrations_lock_index_seq;
       public          postgres    false    205            �           0    0    knex_migrations_lock_index_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;
          public          postgres    false    204            �            1259    16405    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    "deletedAt" timestamp with time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16403    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    207            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    206            /           2604    16435    articles id    DEFAULT     j   ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);
 :   ALTER TABLE public.articles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            .           2604    16422    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            *           2604    16392    knex_migrations id    DEFAULT     x   ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);
 A   ALTER TABLE public.knex_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            +           2604    16400    knex_migrations_lock index    DEFAULT     �   ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);
 I   ALTER TABLE public.knex_migrations_lock ALTER COLUMN index DROP DEFAULT;
       public          postgres    false    205    204    205            ,           2604    16408    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            �          0    16432    articles 
   TABLE DATA           f   COPY public.articles (id, name, description, "imageUrl", content, "userId", "categoryId") FROM stdin;
    public          postgres    false    211   �0       �          0    16419 
   categories 
   TABLE DATA           :   COPY public.categories (id, name, "parentId") FROM stdin;
    public          postgres    false    209   �f       �          0    16389    knex_migrations 
   TABLE DATA           J   COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
    public          postgres    false    203   h       �          0    16397    knex_migrations_lock 
   TABLE DATA           @   COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
    public          postgres    false    205   �h       �          0    16405    users 
   TABLE DATA           N   COPY public.users (id, name, email, password, admin, "deletedAt") FROM stdin;
    public          postgres    false    207   �h       �           0    0    articles_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.articles_id_seq', 39, true);
          public          postgres    false    210            �           0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 30, true);
          public          postgres    false    208            �           0    0    knex_migrations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.knex_migrations_id_seq', 4, true);
          public          postgres    false    202            �           0    0    knex_migrations_lock_index_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);
          public          postgres    false    204            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    206            ;           2606    16440    articles articles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.articles DROP CONSTRAINT articles_pkey;
       public            postgres    false    211            9           2606    16424    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    209            3           2606    16402 .   knex_migrations_lock knex_migrations_lock_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);
 X   ALTER TABLE ONLY public.knex_migrations_lock DROP CONSTRAINT knex_migrations_lock_pkey;
       public            postgres    false    205            1           2606    16394 $   knex_migrations knex_migrations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.knex_migrations DROP CONSTRAINT knex_migrations_pkey;
       public            postgres    false    203            5           2606    16416    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    207            7           2606    16414    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    207            >           2606    16446 $   articles articles_categoryid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_categoryid_foreign FOREIGN KEY ("categoryId") REFERENCES public.categories(id);
 N   ALTER TABLE ONLY public.articles DROP CONSTRAINT articles_categoryid_foreign;
       public          postgres    false    2873    209    211            =           2606    16441     articles articles_userid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_userid_foreign FOREIGN KEY ("userId") REFERENCES public.users(id);
 J   ALTER TABLE ONLY public.articles DROP CONSTRAINT articles_userid_foreign;
       public          postgres    false    211    207    2871            <           2606    16425 &   categories categories_parentid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parentid_foreign FOREIGN KEY ("parentId") REFERENCES public.categories(id);
 P   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_parentid_foreign;
       public          postgres    false    2873    209    209            �      x��}�r$�����a�fuku8K�QS-�Y[��Qi�/�})q���&�Z�o���0�P?6x� �G�I�l�ƪd���?<�}�n����n��������<����+������X|�������ҏa����ŏ�g	���]��������L����wc�a��]�����ǿ�`}�;�\�:;��?ǻ�?�]z����������8a����8��K���cqe�#>	3`$��&?Ļ�8V\O\M\�q�[���V�ۏ�S^���u� ����1!��L�/X���Vه=�b�wǷ�����b�r�R������6��B��<��g�G�����F�� +��dam</��=�F���]�����1�����0�n5��|����1�sC���+��[� �Ľ�0�o��ӌ{��?�������w5Z=V�W!�x�����'�7K�n���
� ´=c|3�	�˹s�4��:�9;>�cV�Ҽ,n�������i�]s>X�|�+W��zk�/͔�Th�5 �
p:���}��笳���?���u��>d^��?�}$�����E&p��8p���|;R�^��`��08r�G*~ �H�#�= ��	ƀm�͍wû�s6T���r�=]�k_ލ(�ׄ����ba
�fD��w��Dp���9e5���9�Z^b.��V�w5�������:"\�ǯ���<`��;�fӄ�\�>�<���ygo~�����i�������t7?<��y�{:=����o��Ǉ�O����v�2?��O���p���4�Ɵ��t�é�uj�� �I��}�r$poK��XK��@� U X�n#e�\���|�Xg�1�m\yϙQ�hd�}��ۼ�H���>L�	W��r!���jL�0�(��7�3�_�<�g�0��<�� �7�'>?E�/��6��ec
[�8H.�����оX@u�O��C1�(�a��s�Ӕ��.�=:l�a�'=���i~x6b�)�����v6��,��S�gXテ���	j��H�`�����S�7�����D�i�6$�'C�рlXa�`0���g��B+X�y�5d���^#}oS&o�,�'pHnx[ڔ����"L0�I��b�?�.���Z̲9�@���X��Hpfv��G��w#��sA�Fl<�)J���G0H��g ����8�Q��Aw�Sx�$]���x�Tξ�
�ԛ����_���E��G	�J@1�"-�5��u`���͡fG(֔�{9>�t�Kq���W�K���m�
�V(zǧ����(���.���5G���� M�����<?h���E7�hԿ7ߣ��ڃXu����?>=|��N���`I�À� ����og�M�ǡ:�������E�9����<���M��F 6�Tj��@��x{��]AD����ez�<L�ne^��#�E6�Ҹ6�Uj0h6�=0˗����F��Q��$�3Gb��fq{$Gb� �9bjKӄa����}ɨ�_�C�>�� � FZ�R=�����W���e�a4<6/	��׻��Y"�9�kS��5ۺ����*�i��!�i�Q�;�ϟvO�ݿ�y*T.G�I�
�u�=ɈxGQ�U�+`]�j��&����[pt����WZ1�`�iy��0�(;�
"��������X���y;X��!�Y�+l+�e���El/l�y�]G�5ٕ�Q0` 5,�?S( �W�W�_��m�:�}�?��O|:)���R������£��;5�Ӎ�7 :�L��%+~�zX#K��G늞��Q҃Z�D�T��\�o+j����#�4�:�W�.�yz:S[2���ȕ@3����)�19w�=�gA]��-�S�20^w��ꪳ,gB��f��R�W�J�l��9�\�Kܕy5,�`_�QIR~�v���2U �%�U�m���G\�T�z=q,�x�d?�)x�Ȓ�ch� GP�-���I5�>�"7�QP��V���R6Q���qS.OncZSޒ��	,�����>\�Ȉ.�ȉ��6~v$	��Źh�+�[S^<����B���f�*٠^���F�5 �l�
B�ݗ��$^@���O��W�?����vwb�����Tcw�'ݶ��yF��]fqeGs��pk0#�5�����@5E�Ot�h��Hi�b6�Stk'��Ѥ�qp�@)���j�x�Y�x�V�]e\��K�n���uD�6����a�ul�$|B��'��6�{��`�ft�3���[��j�#�"i����w|6ʀ�4Q�@TS�N�W��q�VT��`�.�3�������r���N�?���"����0��3 �o��\�3B}"�����~t�+�.���#=��{���{'7���D͔�V�������wk)x�qٵlF4Ptv�������zx_á�6�,�8:�dX{�4P.���`$�f�'M�g�GG���l#{S�V���ـ�56w`T������Wd�����H�A�W�>-��L<�������N�{��,ĕ�g� �q���� �O\���1Hl��ψ'��F^��?�'w�C܀1.��WW��#,m�v�ӭz��lD
��Î��-�`
;D�K�⥀[��^@�z6�O��k��H6��I3�HY�ռB�w��������2ٳ\òe���R
�W���4N��y�[�, e��D:�m����K=���7a��V�>�Pa�8�
,7���I�=s���}q�O�{�ت;��]O���2U��^$Q�����&�ӡ���6 !Y6�=��R��ސ���:ޏ{X˴�0��)�����ˊ�rE(��ɥZ�<�&)y��E�G�"Ό;b�>��������]�;�砌�U�EYlx�c�1EG��2���4b
��Q��K�_S�Qa	�F��&mŝ�^�����)r5�i�g�N R���=�0��D�j�&q.�9驲��V!��jM�0 gF=�I�w8"�A�>���K �x_9R�c��Z�D��~D�pp�N�"v�:�И��ռZ��7"?,��L霠�Y��
[>�����(v��c� �������3?>���w����ӿ|_Hߌ�b�C��B�	���Z0m
����$��m�4)������[%[	�"�_ٷ�E�L?�g�fY�|��6�]�������q~��������4�Oq�wO�w��/N�����oO�O����j��rQ����a����������h9=�>�~w:�\�K��ѐc@�o]��@����+_#��7����x��:�I���n"���4��x���%�G̓"��Μ4��a�\{���7{>o�59��`U5Fu��滏w�����O����S�~��o��	�~s�a.�bDL�-�w8Ɖ�(i8@+�jY�-�[?���rtt��ѳF�\��;��`��~14m���(C�t��a��<���.D'BV���%�v2�#{$3��L�q��`�"�`"�k>q.�s��\�!��A�,s���+�z��w Hi�����"��G ~���_�����=ĕú/�Q��������,���0Ԥ����u�X�ITE�����_�P�����d/���NGJ}�{�Lۣ*y�Xb����ǵG�3����ʥc���dH�#�%24��{γn�"�މ���Ɵ1F�9V8��z�Zra�1ErV�Eu$�ȁ�^��Ɉ?}�W{T�帣�s�L�~ħ}߁;O�5���&I:�(�1�8 f��A|/������Q}/�PR��D�'|f��\�	`�������]��Eh�3�:���Tsy��Oq�	���Cl����f&8�#����7����{2������m��g����A�� �P�%�-��:AB� ��W .�q������щ6�h���k�>�	��	��b(�R~0�=���f�4���R�6��v�n|��at,*���l0���d�O#6L���$�*~Pf�c����Q�0���Э��[�d:���lL�:d�w�����    ����V��֎���O�K|���B���Z����O>{�]1�+���>}�3,�w۞F&�F1�)e����H�
�b{V�"A�(�'4 �R�m�'�vE���wEDBbD�#����=�?w���pB�o����*��{�B�:�>%�m�.�%���=
!.q�N[��=�]�;`���-��t��bOe��*(ڸ��c�1�0Y���i����;пb1�d���
Lvp�%�������*٧؄��m��!�?�m��o�I�U�G��cQ�7���3�%�<,��ǖ^9k��aty,{ɖ�I�T���3�59�7�"�H�������qU���w�7Q�&�����9?s�	oO?~8�G��{���~~:����������ӟ#%�����������Xo�i[U��@�{�:y�.�%f���dë��� ��R}1��uUoP�{MQ)����8�L�(�b�"8B�#V�yf=���-.�y��1��ҮV��&�"N����f�Bj&q6�_)�1����8��r	�K��ZŐ�����G���M����K1��_�����X��(����j<�]�V}�g�vDxgJ9�ϼ�,��25�ZFA�����>���6�ٯ��2-����vX4�������C�
���S3n�:<��u8�Q���{��ظ����V��~´�?{'Rd�އ5�zý�=N���T�o˶o'J�_JE%9��\)up����'�9���⍳Y�M�t�l_�6��ϳ�~ͼ �P��QN��Ұ�o�7fN)�+QWYᕴ��W�<�x&J]!��[�5y΁S@=ғ�E�r䎎����b�-�,���7t�N�a��������*b�,��$��=�A��%�<��w��@����ᥔ���͹dį��ɐ�tq0�쎙��#����x� W���St�v|ʀ�+P4䀑(����h 2�\��g�3�<X*���Ǉ+ގ笩P>3���QT�-�;�o�$�L",�:5�w����<}���w?�����Ӄ��7�����D��w �σ�8����3�y)c$�4�rޭ2�$�p�%��Y7޵�ђQb*���Sm!/zxe���a���ۻ�=�����!���_�fs{?���#
�X�����f�P,�F)����ļ�;�]��a������?�{�}��C�n������O��n>>܃ۜ����v��t^�\!{�yw֦}������eX��q\��rk;��\����r�������"�#�(�b�;�����k`�"T�0^���cn���
��`g|�u����������-��UP�`e���eء,v^��P�|���d:?�zb��=�r��mB����Δ�'�-�(ī&�}�u��)�X�`g�bu����]�q�N��(V��3�sv����>^1xG!ܹ([��_Z�W�8����l#e��x2^�G��[���(zj��A900��"Q`� �q#�\��0��;��L�3��E�E�������ޜQ8�y_�)�{��7G|�[| ��P��Y���OQ2ܯ�1uʧwG�?H1�K~(U��X6�#�2���x��
�OF�0�)�Ie���u�L[�=r���-���Ȏ�hA�$I7��VFk J+�m����-]N���x�6��h`8~�h!:���d&�i��Jw�hW����T
W.��R\��y	��|3��du�,e����벦TGx�*	E�~�V�#�
C�Xөg%V
kE�0���U�"%�a�k�X���^³XerB�٨��q�sJ�/�}+ћT�S�\Ul�;�g���y�Y\����4��f�uq�r�GEp�d[�l��NN��)ΧOEx�1�t.N��I��e�UV���t ���zU8r$���������������_������݇'v��_�^��Q�H��3�2W ��S�%�|Q�q`����W�/����CA��y����@��݂������(����V����Q����@2<���J=scE%'����TT�9�"�����t*���NL%��e)[����ݟ�?���p:M?{����
H�����fY�:��ĉy΄K�-�Y{����Y�	�;s�����8Ώ����ݏNO���b��87�QE���-+��`��Ma�\K��s&IkG��!��1�Q��9�^5z�Sb�C��ߡFJ�Z�
�)��LQ��nN��}q�X�����h�'��`z�Oqdר9�MһJ$��PT�U���'�{��[�eL�VV�|���}�}�l�ܕ������O�{>E�8޿���a���-.QW�M��կ�B�)��r�5�Ѹ%�����6��Xhb+�Ǡ��P�S�	���b�%��
�����������ǚJHB��҅�Qӂ�g��������!o��g���遅�7�/'��������K���ф+G;����|iJ���-V�]Ķ�pz��_/8���:�Ci��q�חW�xԕ.�Ke$k�E��m�{�{��3��<p�D8rw��>�%a��)�ן��)�>4QX��.�K��KmZW.3��_Aκ${c�n�@�e��E�����VMV��AX�Z\<w���HAAG�T�Tp�0��(�9Χ��[jEE�=£��l�!�K�����M>L�Ԣ���f�3�A��o8�!��K|����݋[��ag������q�ٗN��N�n1�.V���K ��Δ�b���0�����ގ��C{��U��J�.�4U�$�)��n�~�g>d��G]ƏcQ@�Pu��a�E�j�4��;��n%ǽ��~5�'䛯{��\=�œ]��c��8T�x*	�Z�zj�V���Z� ɳŽt��	�%��@N�
��.�֢����gk��^���Z#�w�u4��g!6$PAO/��-��Cۃ���9`������H����t(T�_��Д;��=��!�nO�#-�g��=�Q�����li�m������Z3}slh�g8.D��X*h����K� �5�ȫ�
Eh�ŗ�^�����JW(��w|YC(#���(IT��<����=`�"��W��$-Bt�S�`�Fr(i��
 ��^��lŪC��n�����\Y��bN7Z�U�#W�⵩�OM�R�J�ȭڸ@@��QR��A�)R�� H����)�UQTi2��T5�ĳZ�B܀¸��*}ɪȂ�na��F��=*�Wv>�d��:��X*I�B���:���,ջɛqK#�e�F����<o�
yrnѵq
�-R��α��ޚ��G�:�#���Sq]��{�b��$� �`������$���t�t�^�����)�=�:�L#�:��ct@�sw�$�m^~����mR�F��]ǧ�i�П �M_]N�־2��Q� �<T�C9Y�xjv�=Jd-��ڝ6c*����O4&��ǁ����W?������O�S��P�>�]���!��y�|����O��Y�jYH4���"�ѫ`�l�2�wxg���!fu7ͻ���a����{�{|�<�5o��2��4������,�ul���*>��>8>%��y�B��*[u��e6@����T��N��\��7�T�j@a����%�g
��C�Ϯ6U���7��5b/��7uDvܝt!�Ų��jD�.�"*:T��e�9���{�;(�
[��W�NU��LmN5��>U�"f��kz4P����NUè��Q_�8F��
�y��?���S������Y��f�Jp�$"�\Mz��^2ƪ;F�����L�g�_�p�2aGW`�:E/��C����/Ry�΄a����v%Ό&ush�NNG"'v���G{�,F�O^:8�]\�"�q<�\d�v@t�az��t�-f�	*%5�R*�<�Kw��CHo�~�re�5�jO魨�����ѪpH�)t�@Ѱ�ɡ�-�����5D�(Sv�֪��F��#�{{�B��Q�Uƒ�@s�!��H��P���nF���������9�\�^ePI��u~7���5��R���ݝt�����qpk�    �ڇ��F_�,�oj.ü�!���x�Q4�ڐ���喪'�i�vV�ci5i�˵*�<$c,L���D�Ǵ��	z\J'�Ww��k['w����é�a���P�t��EC��x��Ľ�t�|�YMV��A���2�xO2��Lv,���T��OHM��2EW��t'��l@�'���Zt�Zg���$�O��/�K��;%ْ��EK�탔�A��>f�3Ɓ�z:�D��Zb=�Z��MD�g��0Sߥ�秲�]��P���c���=�sL�W%n��B=�<���Ľd5�,�l�J�$�bDr�%�� 0s;Ϭ�$ϧ��va�^)�W��nn&��5i�(�g�wEG�-�� ���r!`?,|�X|]}��Zk��'�ؕ�n����oޛ��Ov���ef����x���q��Ώ��B'����en�Iu���MA���Y]R���׫<�W��)�kJ����(�]�dYdѓJ�m7ôgf�����wv�C*�I��r�����P⭗�"�A�3���Z}ޠ�\ȭVu�Ѳ�b��'�	+��YH\\Ɨ!���v����F�k�3	����\!��zi�*�a���j�p��P���̪�ob��I`I0U-� �9�.7u͍W�3��Q����&��$����(�ȃe.p	���Ӱτӧ>D��CR������nI���"�\� ��NG썺{�4J���g��mġA�2�N$	ĸ�F�m�D�#�7��{����Z#2�V-:�t��dM��5��]�'�(�q_�-�j@���d������s|�G���:��E�"#�M��9�g@!�����h���a�uIۢd����c�xX{�tz�[�;Ʈ���N���z���� ��w~_����E0}� �u������t�q�:=�ϻ���ü{������k����:*�D��p~�	���@��5פ)���X�U��ɴ�@pa�ӿ�t ,
&�]���Hx�����n��_�))d1P'iV6R �iP��h}$�K#Y�U���:7l�,J�@��i�u��#QmA�D
RZK��9Xļ�rAS��Bw3	��0mF�y���v�:3ʪYxu��;�ŎDk�2q��i� �Ca�͚���K��blû����0��5W�9���B3�����8�IL_!Ei�1ט�_E� ���L�����&�p��c�Tt��*��f�I4�XX`tI�L���U0�Eq��������,Z�I�r-W�9�+�(�ltN:t������qK� �q���`hGq��.f�V��"��F+ɢbqAy6HD��rY�a�Άa��!��[a��# ۥ[�`��A�����'���۵��Pz64��v6��fg"�;�X,��G����iH몕�׼���b�0h�=>�핔�99����r� �� �,��>��d"��[�{�ϰf��hW��_��#�V�����Su���c��KT�ӘRZ"���@LR0/�H�s9TN�r��,ƛk�J�v� ���{��J�)�\�W8�")�7y"��]wҖ;R����XB�6ǣ��-�|G�#��k�%�qk�l}�J�ٮO�����)ۜ�4��CCdX�>+L�K`b��V�'�&G�y�p?*:jf��g�zg���x�j�f��K��Ҏ-��X����}9~rB�"I������8����q�[��
H��%��;))D���T���F#, ���5�۟���n������OQ?]���pܽ��>>P�ܪ
 R�@)
c��v�oN,x��1.KtG0o@����ɧ�匾Ϝ1�rR�W.�%t�P��h#	n���P��L�еYObrU|��8֧�@��5�<�[��\Y#���*ϯf�D���خ���΂U��m��iE�b<G>�s��ʥEn�Y��^P��t���C�����=P~׌W� ��|���_9���]J[B�vIH��J����y*DU�R8�@�&u�5"�ʶ��&����ݦF�-�_�5vD�Sb�8��E�����Y��<'9桤jvMg�4{)�N��'/)�v�����r��#�0J��+�9�u,Jmjhw�E+��$��/"���f(g�<�y��d3����;E��q7������/ï[�דb�VQT�)j�V�8�b���td�<S��+�[?;y�ouv�tvX0g)�|�z���j>��`�5����J��?=���ⵅ�r�/ԧV����ZS�-�����,0!�\Da�G�g�Zە�p�v�8������Q�!gm���R��a�tGr��嬬�y~o%$��m��O��i�dQ����Ҍ����
S�KE�ϯ(�4V+��\ZQ�SI��ġ0��w �c�(CY�P�	���u��+H$�M������,c�Oi*�_�6jl�=#c$��G�p���w(E8���c]4��E����C��������y#�&A��Sr�a���n�d�:g���+g��c���f������K��!������n�W\v�/��[�%I����Lj��i������xdŢp�Tp�;(o�s��[wg��%5��ᩗ�\}V�?[�N�0��Ć{|���8�����^�g�����`0�!���7t(�ۄALh-�f��`�7�V���,�_�|>�W�$�S�>���p��3��]���
�$�eC��E�^Њ��I�/_ѫF8�([RTt4�
O��#� ���R֘�Rv|�`:���g����d��Wq���[ $�=�jg�߸As�*#��:	l;�D*�P���_����qif���`�����m�&V������T�j���&S����h!_����!��N�X��,P���bR�����j�uC|��e�������z��x!���K�@H~���lE[J����X˜ ;4aWg��0�4s���:�b�ײ�Tc��Y��U�Ɣv�jW�7l�5��K΀nz�x���y��ԅR�hgu�R�/���N�����vpe�!�M#�/������Dq#1~�NXHb[���Q���Aw��4ū"#;��*��KR^NJZ��YQ5 �Cү��o2>�k�x��_'z�/$�֖Y�hL�/�nu��.yP��{拾�f�<��|Q�M��	�ř�+�Sk��S��\a9������pK9+�md��*�������=�_=�Us�(bh^�R�����v��%��%��zs��?8~Κ?χ8������~��p�{����ֵ�ww��R&�d�D >n�\6/0�v�v�q$H��N4���	��m��ϸ�w������*��6]�
t�h>#HP�I��t%HAg柍ۍ(�W��7���5	F��e�Es�� ˭}Ge�k��ɱn���F��a�Z)� ���:��"�X
�@r���2�\�60�9����{��	3g#aY]�"VߠDZGt�?|�J!*C����&��=bۥ����̖GZw�:{�{��e���Kr0/^�8Kb�F���&�u���V�����\���?�x����-�?O���[��t���'���J�s�WZ>�|�9�b��3��8�{��.��n�0�\'�*�(�`Z��g{Iy9*�P��_=�H2�٤̒�wEͬ(��������1Q:�s�)�(=?����'�:�8�rψ��_UK�l�q[e����횫|��k@��ZI�,�E�}�Z�Y�t-^�]o�{8t,�6+���ج+,j���t��"��$>)Lk��U/K��:�A��%��<YS������y��NN�_��ߓ3�V��U9_|�=�V/�s+���!�]���!�O8���T�Kg$�W�����"�6�:��9R[ c�K�T�d��Ӭ�7��;��J=�W��qs=�JG�t��>7��!�,��HAy�RB�I�E~+�P�%��G��r�ҙ�KFz|�P5f�5�W��)"_SD���|M��"�
=��"�5E�k�����)"_SD����a���7ߞ��<�~��n��҅2m��pӼ��t���?�U<-?v1VM^�J�	SEB�R��X�R�%%��eN��M&V%���T�ʍ��eTQ]�S�)lXR��bP��&P1�� �� �  �����6�]&��4��Eh)ƣ(�P�<��Ĩ��j���4�E�I����h��C�:��Z[�
�̨b������L�����i��J?o�ϓ�� P{)gf�w*�ɺ�W#�
�gD6�WE~9���S	4�i�5"u� +�:Uki)Hk\�"vlN�fgK�qO9*)�N�=�7�|�v�]f]V�a���:>������#�!x:7v�uRj�Of����f|�*$�C�IR΅UQ�T��aE�i�Zb�h��2�e���J����p�ĺrŘ&�p�`ĸ�P�U�+��f0K�Slu�X��P���_�$�9�L̰��s$��l��2͑j.��{����6D������O�N�/A�T�O�����Aq���ةӉd�����ڤ���e���7��݈������*��ӥ�7�ע�n�d��X���Cz�g�b��N�[R���-,mHb����C2N��%��^�i6��Bѥ3;�L��t4� l�.jΑ*�"�⒑Y2���<:����T��5��M�5V��<��.O����+)�9��s��|���:�TƔ3~ɜ��	�oe5!E��zl�km���~�n�f�T�ޱJ�����X뼪G�1��4��f���5VL*����b�K�
�K�$G��䨴�k�]S�HiIونї���u�`Ej�ߢ��Gl�����k���jp�c**�};"��O+�X$��`�͆~5�_�YZ�T�|�c����n�%�|)���OZ���Cnŵ�(�4��N�}u̵�h�"y��j�b�/`�ٯ��[�$�G�,���YR&$Z�x����r=D�?I��z#��Uc��%aw�,�B�UåU ��: ��\��r�&���nIS� ���%N{Q�)�u+(���z��n�@��ͯN���w��#����䧲-~�;��{�ceޫ���h.��F���q.�LlD�Q%]ЧM�!8����~r��c�{.p!oj�z�&꒹�U���<{Is+Y,Fm�V���� %��9�?��)K若~W�bu"^G�@W��kpf$SHg��X��؍�U[V}��T'�11��MX_���1�����a,��������ߊ�|=�Dܣ����o� �:n-�T�`�Q���${�+�K5�5���Z����'��7
�[T�ŭEf���>�v6;��\j���6Pz����x�����n�{��������{��g�u�n�[J~D���M��p�΄m�Ø���~�����צ���a$_��=g�Oj Ҩܡ�l��FRuw+
O�,�aY���U=ͮ$�r@F�"2,r�Kߗ���d������V[0�`�4RZ����k*�� =��R)����n�,b���r-��[�#b�G���D��Yi��2��W#/�D��ӎ�:����N��m;���K�u�l��I��<�D�úTȀ�QL)㘜Z��a��WʖX��]�ʭ���*$��(�/���L���it�����{������m      �   "  x�eP�N�0<���'�(vҦ=�!T���؋�,���F�����?������ݙ��XZ盎�|�a=gwv�L�g�K�J��q�����aN��9F�W�/�W�x&7&'!�+�?(v����9�0f"	>�M7}����rH���w��ת�L�+N�"Ea�u�.�A8B�t��������M�h�p�%~��&SG��E��LP���A� P��A� &/.�W�o�3��Q�e�T�}ڮp�U��(�+Ȕ��G���Ÿr�rKm�˪��>&N<��V�`e#g}��ϳz:      �   �   x�}�M� �u9��y���y��Rk�&���6��v��|��A�@0�����B��o�ɿ*�:��{���N�f4���M��d�`(w4�'.ϲR2z���cBik�]���1��B�x���Ƈ�|�L�ҹ�,�Y��1�$aK�      �      x�3�4������ V      �   a   x�3�tL����L�`R/9?�S�(Q��@�4L?�T?'�0"�<�0'���8�(5;���/��%(%39%C?=Ҥ�-]�ͳ$#2T?����3Ə+F��� �4     