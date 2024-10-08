PGDMP                         |           gymrat    15.4    15.4 0    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            4           1262    24576    gymrat    DATABASE     �   CREATE DATABASE gymrat WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE gymrat;
                postgres    false            �            1259    24630    entries    TABLE     �   CREATE TABLE public.entries (
    id integer NOT NULL,
    userid integer,
    exerciseid integer,
    date date,
    weight text,
    reps text,
    sets text,
    duration text,
    rest text,
    pace text,
    comments text
);
    DROP TABLE public.entries;
       public         heap    postgres    false            �            1259    24629    entries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.entries_id_seq;
       public          postgres    false    219            5           0    0    entries_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.entries_id_seq OWNED BY public.entries.id;
          public          postgres    false    218            �            1259    24585 	   exercises    TABLE     �   CREATE TABLE public.exercises (
    id integer NOT NULL,
    name character varying(50),
    musclegroup integer,
    description text,
    photo character varying(50)
);
    DROP TABLE public.exercises;
       public         heap    postgres    false            �            1259    24584    exercises_id_seq    SEQUENCE     �   CREATE SEQUENCE public.exercises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.exercises_id_seq;
       public          postgres    false    217            6           0    0    exercises_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.exercises_id_seq OWNED BY public.exercises.id;
          public          postgres    false    216            �            1259    24678    musclegroups    TABLE        CREATE TABLE public.musclegroups (
    id integer NOT NULL,
    name character varying(50),
    photo character varying(50)
);
     DROP TABLE public.musclegroups;
       public         heap    postgres    false            �            1259    24677    musclegroups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.musclegroups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.musclegroups_id_seq;
       public          postgres    false    224            7           0    0    musclegroups_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.musclegroups_id_seq OWNED BY public.musclegroups.id;
          public          postgres    false    223            �            1259    24662    programincludes    TABLE     ~   CREATE TABLE public.programincludes (
    programid integer NOT NULL,
    exerciseid integer NOT NULL,
    exorder integer
);
 #   DROP TABLE public.programincludes;
       public         heap    postgres    false            �            1259    24649    programs    TABLE     �   CREATE TABLE public.programs (
    id integer NOT NULL,
    name character varying(50),
    description text,
    goal text,
    durationinminutes integer,
    difficulty integer
);
    DROP TABLE public.programs;
       public         heap    postgres    false            �            1259    24648    programs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.programs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.programs_id_seq;
       public          postgres    false    221            8           0    0    programs_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.programs_id_seq OWNED BY public.programs.id;
          public          postgres    false    220            �            1259    24578    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(50),
    username character varying(50) NOT NULL,
    password character varying(100)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24577    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215            9           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    214                       2604    24633 
   entries id    DEFAULT     h   ALTER TABLE ONLY public.entries ALTER COLUMN id SET DEFAULT nextval('public.entries_id_seq'::regclass);
 9   ALTER TABLE public.entries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            ~           2604    24588    exercises id    DEFAULT     l   ALTER TABLE ONLY public.exercises ALTER COLUMN id SET DEFAULT nextval('public.exercises_id_seq'::regclass);
 ;   ALTER TABLE public.exercises ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    24681    musclegroups id    DEFAULT     r   ALTER TABLE ONLY public.musclegroups ALTER COLUMN id SET DEFAULT nextval('public.musclegroups_id_seq'::regclass);
 >   ALTER TABLE public.musclegroups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    24652    programs id    DEFAULT     j   ALTER TABLE ONLY public.programs ALTER COLUMN id SET DEFAULT nextval('public.programs_id_seq'::regclass);
 :   ALTER TABLE public.programs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            }           2604    24581    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            )          0    24630    entries 
   TABLE DATA           s   COPY public.entries (id, userid, exerciseid, date, weight, reps, sets, duration, rest, pace, comments) FROM stdin;
    public          postgres    false    219   m5       '          0    24585 	   exercises 
   TABLE DATA           N   COPY public.exercises (id, name, musclegroup, description, photo) FROM stdin;
    public          postgres    false    217   6       .          0    24678    musclegroups 
   TABLE DATA           7   COPY public.musclegroups (id, name, photo) FROM stdin;
    public          postgres    false    224   �]       ,          0    24662    programincludes 
   TABLE DATA           I   COPY public.programincludes (programid, exerciseid, exorder) FROM stdin;
    public          postgres    false    222   �^       +          0    24649    programs 
   TABLE DATA           ^   COPY public.programs (id, name, description, goal, durationinminutes, difficulty) FROM stdin;
    public          postgres    false    221   �_       %          0    24578    users 
   TABLE DATA           >   COPY public.users (id, email, username, password) FROM stdin;
    public          postgres    false    215   �a       :           0    0    entries_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.entries_id_seq', 17, true);
          public          postgres    false    218            ;           0    0    exercises_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.exercises_id_seq', 2, true);
          public          postgres    false    216            <           0    0    musclegroups_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.musclegroups_id_seq', 1, false);
          public          postgres    false    223            =           0    0    programs_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.programs_id_seq', 4, true);
          public          postgres    false    220            >           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 10, true);
          public          postgres    false    214            �           2606    24637    entries entries_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.entries
    ADD CONSTRAINT entries_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.entries DROP CONSTRAINT entries_pkey;
       public            postgres    false    219            �           2606    24691    exercises exercises_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT exercises_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.exercises DROP CONSTRAINT exercises_name_key;
       public            postgres    false    217            �           2606    24592    exercises exercises_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT exercises_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.exercises DROP CONSTRAINT exercises_pkey;
       public            postgres    false    217            �           2606    24683    musclegroups musclegroups_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.musclegroups
    ADD CONSTRAINT musclegroups_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.musclegroups DROP CONSTRAINT musclegroups_pkey;
       public            postgres    false    224            �           2606    24666 $   programincludes programincludes_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.programincludes
    ADD CONSTRAINT programincludes_pkey PRIMARY KEY (programid, exerciseid);
 N   ALTER TABLE ONLY public.programincludes DROP CONSTRAINT programincludes_pkey;
       public            postgres    false    222    222            �           2606    24656    programs programs_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.programs DROP CONSTRAINT programs_pkey;
       public            postgres    false    221            �           2606    24583    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    24693    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    215            �           2606    24643    entries entries_exerciseid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entries
    ADD CONSTRAINT entries_exerciseid_fkey FOREIGN KEY (exerciseid) REFERENCES public.exercises(id);
 I   ALTER TABLE ONLY public.entries DROP CONSTRAINT entries_exerciseid_fkey;
       public          postgres    false    219    3209    217            �           2606    24638    entries entries_userid_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.entries
    ADD CONSTRAINT entries_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id);
 E   ALTER TABLE ONLY public.entries DROP CONSTRAINT entries_userid_fkey;
       public          postgres    false    219    215    3203            �           2606    24672 /   programincludes programincludes_exerciseid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.programincludes
    ADD CONSTRAINT programincludes_exerciseid_fkey FOREIGN KEY (exerciseid) REFERENCES public.exercises(id);
 Y   ALTER TABLE ONLY public.programincludes DROP CONSTRAINT programincludes_exerciseid_fkey;
       public          postgres    false    217    222    3209            �           2606    24667 .   programincludes programincludes_programid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.programincludes
    ADD CONSTRAINT programincludes_programid_fkey FOREIGN KEY (programid) REFERENCES public.programs(id);
 X   ALTER TABLE ONLY public.programincludes DROP CONSTRAINT programincludes_programid_fkey;
       public          postgres    false    3213    222    221            )   �   x�e���0D��St���m�`�R*H�����E��bY�;� A�\O)�0����q�S��;�3�5�s=/ ���?�>���ic_o�35�j���JR��ʃƠ��.rNR�Z�H�1�<vS_ܫ�8�7K����]}=��/�      '      x��]I��F�>S����$�����>��0�{0x@_()%�E�&U���fF&I����p�-����|��m�k����y_�}S|8�rC��x��}Y�ۦ�ޖU�+��vW�\;TM�޵��X}U�u{(�'�ok���X�P�7x�����o��nO�G�e�ݥٹ�/��C_o�ٯ��s����Z�]����ە]K�7p�W��sI�ϭ��y��4�~�U��7�iʦ�vp���w���N�+�o�;_5>i�%��{v-�}\��o���������w���^�����n�9������S��~e��'���5g_n.u�:Æ�M��F�n.CY5�+�cu���r7uS��kQ�Ǿ���-o�z��'��ܝ/M��; w	䅟t@���h]��mwg!�>����~�����݋���O?��+����b[�����U���\�uw���IT� Aw�^��T���u�����낶��-.�_.��"~ƿW�7L�d\��+]����v���ׄ}��*�ʌ�����@�~$�[/�kwa&�h��)2�$|�/��;������]:<#��.`E;/�3�s]����;�A �6«t�5�����>��U=n���g��G.%�j�3RrSm��������,�'���Y� ڥG��$n��]��T��������l$�1\E�"�!U�-0H��)�x�v����&���o������TP��ݎ�~[� ��	��/�S���O(��u��[H������F��+w���e�s_�`esV.�UNRt�E�]�_Cn̇��]�2/�B����?��E��/qk�M?\z8'��P������7���U�=q����l��tz�b�jy6n��]�D�[���#�5BJ�%�O�\��ET�6@%N�o�{�H)	.=*�u���xW|w9mȀ�ڑRK�,�sh1���<�F̓��O��и��ɖ�a��ʝ�D�Upo�fNMYYm:��u�o�1k*:?�=Y�x&��|p�۱��v��w�nhi�d��@�!W��[~ �k�n�5ʳd1�:V�jKc*����?�~C* O�k3w:+��՚?^k�e��`<�x�x�l%G�ع= %F�s�_�4ɾq�����T}�O�od��s�	�@Wq�}�P������,��/�5�˶|{�x�}`'�3Ay��
a�pwx&��L�,�
�u�jR�
W�Ov��7`��'l
���"f\|V|��%��O_<<�Dݱ
s�L���-��#����V�G�����@	4����&Y��� z���	(�=V5`�|�*��&��Hɠ�+w�K�!p�k�!�@(�� �g�vB��4#�~�wn(=Hn� �۾3D�@2��˚r� ��y7�X�ݎ��%J�蹡#����QO�/���,�制41���Ɲd�u������Y��'�
Y�:�@�U�Ӿ��#o#J�Q)� 8��w�`�7
GX��RPMۡ�}U�ߪ�S�&M�
.��%*݀�I�OD���5��>L	�y�����@�pa����]��{)޲�/�����nN8��D�0�d���d�	؂��d��^�= �MWW�SpR�E�@���,M�Ē1���d�<2-��xȺ�U}0��#F@1���,����:_�����U�Y�\k0���# ��!���z��6;@� �(Ś�q(K�ʦ�i gxD��U�g�hd�����\3���Cv�ļ�ھ�p"���e0� _�4��u�xV'���Y?�S�zE�#�ɧX�.�7u����nٝ�(K��S[���NO)��[�5"�?����ψ���J���Yc���ih�߈\&\v%,]� ŀk��+:�C5*�ٜ��j���g�����7,ޓ%Bu��q�Eڃ���c'=:�Mc�G��R ^�c��S.W��t� �@H�~��(��݋}�k6lg�!�H������M�HD� B����R"1�Htp�^C/�1A{�8cF�g������*��|��,rdC�^�H���,�#;��Rl�e�|@a���ۆmn9�@M���Xvf�b�<w��	��Sɤ��+]��8h<Ѡ�,���%E���n��Q��F��j	�$8)H~�r���z>���pgq�B.A[��66޳4��)�v�er���/}w� #,��p��3�p��a�ϣ�q��u�Qtzu����tn��96Tm�O��aWæz��4HD+��jp��H��t��̈�&'��Ɋ��\a7w	~�P_��Br�p��r�ٕ�Sl���>�L�?8A�꺩t�mY#���P������.��f݇�s�L`CLDͫ��2lL�X�l�]!�'I`�"==;�����e���c!��EH��� !O՛� ��M����=4ndV\�)�HP�AO��[<H6*8���b;8㓛B��KO�S��i]~=�'|nPjd�b��"[���숣�*�D����#I �\�4�����W����7��N��*=>�*,�D�q�M+֢��y��I���6�t���:
WdaR��J�"]�֏�DE�Ϭ	�3戥֝�ʑ9�Q<Ƒ	�C����-�
 F�&m�8�^9HO�aɾcn�-\2rV5�&V�E/�V�Ѭ�Y+|0����N���Ʌۑ��5s�
�w�쐛�$��06��%u�{���$�6�7�Tr�7�VUho�d��#�	��l{"E_x�V���è�Cیi	
YU���-�	���E�x4��Нso�y��-�N�u��I�؎�	֞��l܂�>1x��)�QU#HIy;�/AF�0�-q�Y��ć9�F"(�)+��.�츮@%a��Њ���x�P��R��x|�]�|�j��+�cS���;	��d0:!�p�Jd�E�d:�VŃ���<�pitHeR#C��Ii��E�ÝQ��\�ai���j���ܬO��Y�ط�$�'Q%A�;Dk|��AT��#0Wٱe"�e�^�X|,ߛ��E'��N!2;�0'�b��d����h�d]��5o�o��,����Ż����N���F�L$�?�o�����k(����&���X�4������ba-

�V ��(Y�e�1��������u�#8 �u��*,^�!M�;n
|).�WsR]�Wd��H�y�?��� /���T�V�����cH/�O�Q�(-܌0�3tdqYUB��m��iK!>k,�w�sF}��v*_�.hW+����wŏ��o�Y17�!Z�vG8���_/��>L���GL\5�39h��1S�!�D�W�ǰV��fic�tA%�a��RT�y���(L	��f�SF����{ն�_��9%���H->;	����Ȼ����&Y�YOi�<T�DUO���!z��b8�giF�������z�W��}��>	�$D���s`T]E������Ohb�ބI'�U�?�!��
�gŇ^D!���=�/�p����=T�|�G��>���t��!�|C�t�Y�ķA���ua1��%�~�m� ���|S������eIJj����?��4l�X>��	�	'�Es+���+/�9��w����oE\�gr�(џ	��As��O����b�{��s\��
i�.""~6"�y��̆G�j��L��X�}�!d��������Q�E��cM�FJ��V<(��LJ��N����2���!�IQ��<�7�"��v�i՘x�_����rO��z�v�w8㲱�#>����/�����=ڏ���r#�ՙ��)x�����R�k/Y �#�O]or}��� �o�{��E����e���o �����&Ԝ���S�ʱH�vb6�'�Ȕ��T��v���<��丢,�]���R�����lHʞ!6�s�{O�B�D]"� ś1Ao[�����HA+� ꍅ�Ṹ�v�SJ���s�(�@��4	 T/��
��,������>g?.M�S|�L b����Z�Za���	?������q�T�ٛ�&2�(hB����n,#��;�	"    ?�*p���GI����]��5ܵ�c�n�`�g������4p=��T���Y
��K�c�9~	YPk|`� ��Ή�%/E2B��=Tp�۶�T_�W ��.�
�}q)�ۉ�5.+�q�v�\��vJ��'���E쫑⾤�A_��f�U_߁�A~�}?�R��7�
CH�MT!%u��D�[�e�<4wu�!��k�O�/\ع4ŉ�E����� �g'+�\i�AV䥭�����:�)�o �)^���ՒɀI~#�i��H�\�U�g�1|�Ï�W2�7�u��'�U��`ȧ��n�L �l��x���M�#��? �}`���qC�t	j��b�13 ��_�n�H;�cu��B::�Up�Y8>�oTWJ�F�V!
R�I�V*�+m;�jk[)Zm�D�y�5A��S��4=i5y*+s)�Q��E��6������TA���=��rc9+�����o�=p`,a�D~J�Nڍm�>��?B��{���d� �0�}5ae}�@G-P*�I���V��`��7v۱<{6r����xx[�v�q�����d�'��̄���ے����$���jr1�t]�9_NS�q�>�j�y�Ĩs��r���O�ݲ�3�a�L�{5\�<FӲMR�K����ІP�C�}���.�	�4u>�O3�f��� ~0uM���h�ػ�����dT��*Ιؽ&��3?<?_ yG��������0�n���\����S�`�`i�Ĵ����5�/�!�{Q@O�bl�jl:��EL��iX7��D1�#y�Xe�����B�=��!��Sk�L�:��33���W~GA�qT{wv�&u��ခ��8G�,@�yiI��Pɩǡ��LpL�$z�ÒJ�ۻ�թ�����
�&��R��X�Lw_X3("�T�
��΍��F��vދ��xx,ޟa�h������K�P�7n�8w�W"�r�>'_I+]R���E�!�M^S
|��ͼE������>�Co4GQ\��ɩ��Ȅ�D�$���\�$S�`�1n��E6�s�F(D�~��������7��VI���F�o�"T��W�1���~ ���'�[�����
�5Q(��+��6}�c�7��{�Rt~s	���Co�`p���*�z��^�~'�`�}(�!��� pO�|T��;`�S��IC��t!�}�းC�i�6u�7K�m��i]~G\��,���PL�i/����:w��LM��.���5�k7��g����$w��0�ʔ����S7[�;��헉o�>��PH��T>d�]3�"zCGM�H0�����*KSe�Y��i�:��M�Ь�O�ܽnE6�TUF��Ne.�,N��!�'5��۹1�|BO	�ֵZ��t#HV��u @���:�7B�Q
�U�K1-mE�R��7��vg�����ԍ��$&eQ6�^+Чz��)	�fހ�k�)C��k�G� 2�%j�m�`�����������>b)�/�c�]������P���m�{)���"uK�:v�S�k���fd���ԉ̬�7j��f�8'|ÃB�|��;�|Y�N#± )�k,ա�g���Ȳ�tv�s-�;��E��ǳ#�����?�(��;�;z��b5��?��@���h�<+R��Ð�$]���sM@�Tk�-OYI���U�ha9hH�ĉ�Ni���S�	E�C(��ļ&Nux<ޙLG�;_<|Q�(����g�r�Wv������,�#������iȔ�8�W�S��vwqƄô6��B!J��އ��z� t�|w���[�R;����7��gb��pMȪYS>��˙�Hգ) N�P�=�Iae.[
:%���&��>Y�3U`���@�x�D���<`z����4l�z!����&��,����fX����q�_��5��!�6��PxU\���9�E�k����;U�.#�!�v����C�&׭r�4��@$�qjt�B$�r��)Rվ.��
oޥ�u�y6؁K�e�֢ 0��(�@�@�s�M��aM�`����Y
��i��X��E�=����@��K���Hr�yui��l!�5�X�����4mN�����{��W�?��l��2�f|1�]NL��� ж��2�I���3:8[8̺{�d�Yprw��E%�W�'��:3�����x�v��S �ZO��3]L,�w�uy�}u���� Z�,��6�j��p�2��Ir"� �;/�U��N���u8�E�Ib��A���Ua��SApf"6�A���6P6��A���i��(���KK�̫~���f}��J��Ȱӈ���M�*���_�3nL�ۿ���O���&�\���f��Ƹ�{h��Ny��p��"�#WXW��U/�� uQ�?������M���`U&J<&����2p	�R9Р*J�ҳY���P/���s5R�G�0q���	�T�Qp*,��9`�5�Wt,D����[�s�qK3����M��K�cz���$ե2�:h���h�?p���"d@>�iTYh]���9�s33Ɠ~Q�_�N�3��c=h�ęˡ��Zh��ta�۹#�{]�3���DY�M�d�Q;B.�[��x���6>a�%��l>J<�A)#�{h�s�z*H��-_�Y�ܡw�84NFjƶ<Jv�_��i���p+�:��S��qi\�q��f��BB5�`���U�:�$�����S>M�,��%"{k�ƌݚ�+�s�!˴�.f鵘C��N�������A".�� ��k���\�û�$��1J�2�Kf�KK��K���Z˰݆TZ�6�8�(�A�KAZ���nWoi B�=��c�,�*B���W��o�Sb����
��Z�ف��G-�7�*VB�>ȀΠ
L8�{%��YV�V֞}���8�:���5x�\�PŏfT���A��� F]���8�/��VcX@��}�|����.p~���7�gR�h����y�jx�#ɹ���>ߑ3$��P��7Z�Jz%uU7 �{��zI�/�X3��{p�lVN�ɳ�w&��L�O=-)ѿ_��-|�^N�%�u���c�+Ƈ2BE�4�'�adO0N���L@|V	+<�s��k��r��V�6>�s%C=�U�hDci;�Ǻ�v&�!���éz�XS�K����2���'��`.P��j�"����)W	;�[�Y�åE������m�o�hfY��Yy�dځ:`
�0,�f���������ˬ�k4��kO���E[�5�=����8���XdFo���2��?z��w�Ib�uHf�jM��V3�G#�l`�������kH��OПH�L�-��H�P�ӹ�~�������-2���
֋�(��Y"BJ��'�~T*����:.�vX5O~���)���A��|$_��}jD�W8$�E�'��=��T	K�P�m����i����zJ|��"B�'�=We��8�X4�H�8�_�� �4���=�Md�B�&���S������L���Cjq�dp3Ya?�}GѺ�G,?+��r:s�����g�'f��CPR���_���tH�_��T(1#LL�#�@��HA��\-�x�;P&L�J쁛��\�*�����)Sͣ#�z�׬6ҍd�w��u��<t]T�S�"��)�3�)6eT8W#a��A�FL�M�w�)"���p0��f��{Zj����T%	6�]��&9B���%"Z��E�xq�"�VR��E�H`0jn���9�6#C��a����iYׅ<��I?/޿ԧ��i���U�҄���OeiQ�b"F�C@�`�z�R*��m��+���:/oa``O���,(������b-	VIa���[�2@.��'寀���
Q�Q	�ؾ�:օz.�(�]5OBf�s��ہ�^z��'�$����J )EP������
��6��l�R��0¥�YIq՜:z���#�,",��{��A6�h�m~,J�Y��A[[�
�fx�{d��c^ �xK�#��G?�{��i[,_d�G@��P<��� �  ��ӟ�N�/n��'3t���1��v�A���q}R�<��LП7��${�+��Bn�x���<��'�?M��-4���0D��Z�k�e�A���6�'���
(�����q��~�V��8��`Y�hn/�*�U�t�lVW�WO�gh�@����s
�gͶ�poql��寃��/Ő(�(�`�y��[`<����t!~�w��@�Pã�(������V�Jn��n�/�.��x�V:ވ�G�9>j��U�ͥ?;瑻��P�<�`�Jh�NL��0������c� �ϒb�'0�!*K.���s,��):Q�l��MJq��	�2H+8�W�����ZK
��;�8<�Ef��pf��'@҄w���c�y���3��=��~[�<�5-"t��bY�0���Egx�}��54'���.�s]l�8�wo�yЌ��!��/�����Zl>�����_�7,5vQ%'u<�!�=q9�O�e�"s%/�4eX(�ڢ�LsI�\������HF2�9u詢�Z�4��R�}��S	���c��LAj`���*G�A��ɺ	��x8v2,��7�{�������/��2��v����;�a�UTQ�NJ�ġ@΃�v<�_�(�,+����{BP�)���J,�Hu�V��$�El��B,b��g&�|�~���Q�9�j
��R!:"t3�r��\�1a1	�P���j�j�̃3k�# ������H\�{(~�%$�Ȁ�S�w�E���Y�ގ-�fN�l)�MID�8E�Ytz���$YMY�Ĕ�b3�Ay���4�hD
1!�(ʜf/M��RUY�#�5$h՜��{+]b�?u������`t�1�F��y�hh�Ϥ���c?=,��x���_$����E,3�
�	N�ڝ��U�i�Ԥ�%��	�eĀbnX��9a'�0S.0FR�'�)U���t�\�����"j㱆�����K��WۧA0�����I�T��韒�G8^���%���s�_���Z"2��Ӛ���������}�}1��<­L+����;��ֹ�����x�ʬn:A�ͼYs�6��<�^�INu��II�]-ŉ�����@���̹�/�y_A��a�r���\��t#}����(�G�m�]��Ob{R&���+j"J&T6�`��F���L�"����o��$��hh7��<>��&�"I�'L f���&���/�;���6�{��Y%��>+�_N�a|��p{�>�)��#��,a�%S1�wo�½��m����+&R�D���m��lH��h��g��UV�j�i8>\����}���X\����{e��e��2����d���_�9.��U��QI��W�;�~мM�m������d�qLZ�����)S���c�J����8̀���ixn��ϋo�Oz�<25?l��On������P�.�Oa�I0՝���.G*��uP����5)���n�l���.}��~7�Hk����,�^��4ddZP�OK(d��Ě-\ĺ�z��x�� ��루���{����7���d�7�L>F����pI>�S�	�Ֆ6��DP��'�(_?�����xJ���^�@z�>iG�������T��mW;�ʹL�Acp���aDj:�5ά��V�<�ah}�릢`<Y��&^�y�{�sG���vܞi�aN�*��.;�hŉ�v1���A2׈����k	Q�bw�@SN�l1yڳ���z�!�w����2�gHl^��G^�_��,�x�|���^y92���%�R���$�#S3׽��X��}���_��s��Vf�e���]��9�I��/ε1�;��A�>;{����Lܘq3�}�R����L��(�w�m�P��6�0T�	�P4���Rz�3,d���>��W<IQ +;2$>�ߑ|+^���z�X�?T)g4      .     x�=��V�0D�ٯ��cY��y�@
t4���>�$~���nvGs�#��ph��P�JB��~7v���mB9^[�;�X�8��\�uBy����Qq�|�V��`M$�G�d��.�8w�X�$I���is4݄��[͒��D 鉈$ލ�XV�.2�lP!�oksw�B�"Ǉ��d�%q�<]��GN�8�b��χ�v��ӂ��W��jL��{e����%.T
<w�dn�Q��mV���W*%^T��o�4����Au�<X�FO�CcG�v�D_D����      ,   �   x�%���0�G1� 0�zI�ud�~�;ˁR�����.���ʅV�:�6��z{Le���ᕲ��I���Z+����ru0���R;���ve�RY�r�<�����x�Fͳl�4 Ÿ1���f�L��� ��Qn��� +��+��lX~��<�g�(��'"��J/�      +   �  x��TM��0=;�bN=�*!��{+lw��J��[/& �cG�Xʿ��,�,�voN�z�͛7��J;!a��L���-��{(�[-�?h���=��4�b����x�ѡԪ���K���u���@�
PU�U"q6L�l���x�Cs���ì�u�;���� �x[J���X��g0c������稗q���^»s�S_�
|Ľ����o��q��r�l�7)��uN��y�4(,�$�+��-C#�e�	g_��<
SoTg3�UPt�7��������gH����`C�AQݴF?#��T�~��v($�T��lA	HX�}��ߥq:��kP�l��6�pN}bO�;�'�����^��E(.R�����b�ɟ�/�U����V�V^{۫��y] ��R��ﵪ!s=[��@λYp�%w�i�7�j���&����H@�H����36���ݬ�7�x~+�QQ|-�ݍ��1I���C��      %   `   x�34������qH�M���K�����9U��TT��L-Ӳr��#\
BrrK�3�SC�KB�ʌ+�\ML����-M|����ғ}S���b���� �     