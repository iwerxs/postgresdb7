PGDMP     4    5                |           dbtest7    15.7 (Debian 15.7-0+deb12u1)    15.7 (Debian 15.7-0+deb12u1) (    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16606    dbtest7    DATABASE     s   CREATE DATABASE dbtest7 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_GB.UTF-8';
    DROP DATABASE dbtest7;
                testusr    false            �            1259    16608 	   companies    TABLE     S   CREATE TABLE public.companies (
    id integer NOT NULL,
    name text NOT NULL
);
    DROP TABLE public.companies;
       public         heap    testusr    false            �            1259    16607    companies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.companies_id_seq;
       public          testusr    false    215            �           0    0    companies_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;
          public          testusr    false    214            �            1259    16652    referral_requests    TABLE     �  CREATE TABLE public.referral_requests (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    referrer_user_id integer NOT NULL,
    company_id integer NOT NULL,
    receiving_company_id integer,
    sent_company_id integer,
    referee_client text NOT NULL,
    referee_client_email text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status text DEFAULT 'pending'::text NOT NULL
);
 %   DROP TABLE public.referral_requests;
       public         heap    testusr    false            �            1259    16651    referral_requests_id_seq    SEQUENCE     �   CREATE SEQUENCE public.referral_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.referral_requests_id_seq;
       public          testusr    false    221            �           0    0    referral_requests_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.referral_requests_id_seq OWNED BY public.referral_requests.id;
          public          testusr    false    220            �            1259    16635    sessions    TABLE     �   CREATE TABLE public.sessions (
    id integer NOT NULL,
    session_id text NOT NULL,
    user_id integer NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.sessions;
       public         heap    testusr    false            �            1259    16634    sessions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sessions_id_seq;
       public          testusr    false    219            �           0    0    sessions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;
          public          testusr    false    218            �            1259    16619    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    role text NOT NULL,
    company_id integer
);
    DROP TABLE public.users;
       public         heap    testusr    false            �            1259    16618    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          testusr    false    217            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          testusr    false    216                       2604    16611    companies id    DEFAULT     l   ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);
 ;   ALTER TABLE public.companies ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    214    215    215                       2604    16655    referral_requests id    DEFAULT     |   ALTER TABLE ONLY public.referral_requests ALTER COLUMN id SET DEFAULT nextval('public.referral_requests_id_seq'::regclass);
 C   ALTER TABLE public.referral_requests ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    221    220    221                       2604    16638    sessions id    DEFAULT     j   ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);
 :   ALTER TABLE public.sessions ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    219    218    219                       2604    16622    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    216    217    217            �          0    16608 	   companies 
   TABLE DATA           -   COPY public.companies (id, name) FROM stdin;
    public          testusr    false    215   �/       �          0    16652    referral_requests 
   TABLE DATA           �   COPY public.referral_requests (id, username, title, content, referrer_user_id, company_id, receiving_company_id, sent_company_id, referee_client, referee_client_email, created_at, status) FROM stdin;
    public          testusr    false    221   �0       �          0    16635    sessions 
   TABLE DATA           S   COPY public.sessions (id, session_id, user_id, expires_at, created_at) FROM stdin;
    public          testusr    false    219   Y6       �          0    16619    users 
   TABLE DATA           P   COPY public.users (id, email, username, password, role, company_id) FROM stdin;
    public          testusr    false    217   4:       �           0    0    companies_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.companies_id_seq', 14, true);
          public          testusr    false    214            �           0    0    referral_requests_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.referral_requests_id_seq', 18, true);
          public          testusr    false    220            �           0    0    sessions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sessions_id_seq', 17, true);
          public          testusr    false    218            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 15, true);
          public          testusr    false    216                       2606    16617    companies companies_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_name_key;
       public            testusr    false    215                       2606    16615    companies companies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public            testusr    false    215            &           2606    16661 (   referral_requests referral_requests_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.referral_requests
    ADD CONSTRAINT referral_requests_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.referral_requests DROP CONSTRAINT referral_requests_pkey;
       public            testusr    false    221            "           2606    16643    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            testusr    false    219            $           2606    16645     sessions sessions_session_id_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_session_id_key UNIQUE (session_id);
 J   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_session_id_key;
       public            testusr    false    219                       2606    16628    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            testusr    false    217                        2606    16626    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            testusr    false    217            )           2606    16667 =   referral_requests referral_requests_receiving_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.referral_requests
    ADD CONSTRAINT referral_requests_receiving_company_id_fkey FOREIGN KEY (receiving_company_id) REFERENCES public.companies(id);
 g   ALTER TABLE ONLY public.referral_requests DROP CONSTRAINT referral_requests_receiving_company_id_fkey;
       public          testusr    false    221    215    3356            *           2606    16662 9   referral_requests referral_requests_referrer_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.referral_requests
    ADD CONSTRAINT referral_requests_referrer_user_id_fkey FOREIGN KEY (referrer_user_id) REFERENCES public.users(id);
 c   ALTER TABLE ONLY public.referral_requests DROP CONSTRAINT referral_requests_referrer_user_id_fkey;
       public          testusr    false    221    217    3360            +           2606    16672 8   referral_requests referral_requests_sent_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.referral_requests
    ADD CONSTRAINT referral_requests_sent_company_id_fkey FOREIGN KEY (sent_company_id) REFERENCES public.companies(id);
 b   ALTER TABLE ONLY public.referral_requests DROP CONSTRAINT referral_requests_sent_company_id_fkey;
       public          testusr    false    221    215    3356            (           2606    16646    sessions sessions_user_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_user_id_fkey;
       public          testusr    false    3360    217    219            '           2606    16629    users users_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_company_id_fkey;
       public          testusr    false    3356    217    215            �   �   x�M��N�@е���iy.KhS��D@l�L'Vbi��<"��J,���^[8�N�q]���ɏ/:;� /`O.�q�L��dVIx	;��H��^���.2I��ڠG�AN�}�h"��3�{J<�ٗ#�BSb$��xB{�����]N<���«�!Y��+�6j�Ю����l��"��5l
�żQ ��非eݷ��3'�~�!�/U      �   �  x�}�[s�8���_��4�o��e��B�̾(���ʒ�����l'��f�$��G�w�2E�\�wZq������ڢ��+/�-�-����`�#
)|z[�vܠ�+�
��?WRo,Qܡ8����E�c��S��H��y��Q�rU���ѭ���)����G�e׶R �6�{2V��	��`D��a)|�7l렐�+��y�IvF��k)*�*��7b��#�[e;�T��+#����F@1apo��k�y@J 8�׾�1e�p/^�-<l�DY<eM�K������m[�D�� �Kl[^	&�ux;XƑ��\ÕC��گ������d���a3:�`g%-��z1y�!%��㗝P�/������3����K2��ф�հ�b:.|���""�r3�'�Igpu��Cy2��7!}�a�^������8E+*�cdWܶ��6����CE���t�8T��]�@o�4A�@_�cJ�(-ҳ ���}�%k�n-��Jܻ�5v��C`+੏F#Xo|�<T�eҲ@�<��4%�Y�O�
�vw�ת��-����x�e��ڢ;h����hG3;�s�z�9��{����y��<0�T
=UqVN��s��^	��zKJ�|d_�I[1���-��b/��kx��3L(_D��[}�)���x�y�,
� ��|�R��i��Fs�'�8^��D����{�����OF-̯MX8~� �.l��|Ň�P4��I��
.�9)��g�����+n�c� �Vw�����I(��H� ʛn���V�᠈�+������d��0#f�&eq^#4��.C��Bu���ZL�&���`��؅"��c+fy M���`�m�x�4A���iD`�Fe�Y�[H��W4����;�����3�3l��O)�>�����l��c����O2����~�:�G��c��!�B�ad�dg4M΢�N�?���n�H���6�M}�u'k\sǠ�j?b�i�7�~��_$C���.�B�
�2nΪJwCqCv��	�atst ��x��l��$.�(=;�i6��%���sx����k0�ܖ�5^,w�f�g�i%82��ο���|��������ʉ�q���!Ƨ}cR©��d�K-�4�9_��y��o�P{���܄����/�v�ٓ�=�^H���`*n�1t��.�����?@c�6��d�Vpx�/Lm6L�G6��^��C����/���/O]�I������(��������O\r��0l�����G���hԯG6�1 O�a���C$�:��8|���n��p�y�@���<��8���|��� � 6j{u���(�b���7B���o�g�X{��Ֆ�͘C�� _§��c'��E!x���0�iA�<OJ:e��\]]�z�(      �   �  x�e�ێ�JE��+� u��� �m�
9	�FZEEE����=�~I�U��,�4�p�Own��y7|������9E�s^��"�̆�v�Kj
T@D\C�b	���DU�L��L-���0L$ޠ��4 ����	�o��d��⚂*
B�t&!��x"F����%�byo���p�1-��Vl��ѽ1��V��'PShU��t!����E�s�(4��a��2�m�ڳ���߶��"r���W�Ӯ�QMaU�,��9B�Ҫ�1�U�t:���8lt��l@�x%>�`m.��V�\�]��k��+� t�$���E2�)I�x��>��v�Y�q<m�g���2ӄ�{JM�5�ǃYSD���ʉ���?��P�J��U:,���p���ؔ��nA�B�=xnݒ�`�����] NӼ ^j����}s�y�.�ϳI��j�e=ߍ�X]�ѹW@,˩u@��y"D�*�f�6���B�K�Ӳ=8�����az8,�I�D�2ٓje�A���^ �%�h���B�x��r���K��ҟ�қ�y��_̶ �d�s�avk��z~6 0�PT=�H
�B��&[��C�_[&�绳)Ȅ�Z#�׭$�����Ms��w;��K���y"L�Z���y,�kt�b;�Y#N����ͧ����4��=Z�kP���0�D�tp�!. ~�	@�
���-.u3��"����z'v+N�0ԲV=i��u��x����BC]R�!�x���r?D�'�-�q{��/Wؗ�q�YX�p�d}GN2�����o9(=Ҁ� X��,�ۓ�"L��P�NA�h-k��n���>.����a��7u�~�4������� ?�f�3��n�H��.+��l,�ӷ�g_f�é����R���,퓢������o����@�V<ODp��
H�i0O�Պm�$�t��Y����'���9�ܫ��?�d W��DH�?]U�?:�*      �   ;  x�u�˒�H�5<��^��`'� ��b6	�@�$ŧo�ʞ�����#��?y��������E�Ί�% (r�상��_��2���b�2�|�b��K�e�#��G$ӴH�1�g�����cs%�j��Ha�`��9*"(�BuU6��D�h����+�1�$|�V�P/n��D]-�? [;@���X^啷���6�r�-�����_�?U�QE�AX���z���EAt�c-b՛䆷VH��.i�J5��}�z�ar���K��%�/�
q��=�\_�oo5���e���R�-ō3ĳ
>I9�4i.�rl;m���AH �T��΄�Y �WxV� �E_(=�����7�2i�d����7�f�	bܖ�L���k�(�Q���&vA*���ވ�R~�*O��;9/���9~s�4e��j
t�����kS^]�v�+G��mls��:V<�%/'���?ۍh���S�'Y��,��<���k�v�c"o9��z'��y�3	�����$U�
�ź��^�U>��J���ZcZ��ۼ%�s�oO}�k���G`OT�
;4��n�LIK��x.��D�\��ӛ�UoeP%�#���ƴH%m ����n }��O�ܵ�/4`�˅�$����`����X���zc%�:�N�������:A Eϗ
B�&�9Ф�����;�D0�>\�ִ!�Di:
$���M�f��Ry�ܔ�1C��(�,KUȟ�PU��`��fY~�G��W�f��Ceb��'>���d�حh��|+��.��o�L׹�v�Y��Y��j��tQ]�7���I�?7F�Լ�Å��Mp2-���R {ݶ�vfrK[��?�_U�uO�����'7�?�/�6�\ڽ-��]�e`�ub勥��(�اZ�2ǷB�`�T�3��u�f�l��hvLe�Da���0l�� ݗ���������?��9h
⅓r�/�SϜoC�n���&�֪1r�l2�l�~v�OiB��O�F9�3Xd��=$AI8Xo2�3/����CՈV�����2�dڛ������u(��rn������� ��U�'�     