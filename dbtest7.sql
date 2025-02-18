PGDMP     "        	            |           dbtest7    15.7 (Debian 15.7-0+deb12u1)    15.7 (Debian 15.7-0+deb12u1) (    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          testusr    false    221   `0       �          0    16635    sessions 
   TABLE DATA           S   COPY public.sessions (id, session_id, user_id, expires_at, created_at) FROM stdin;
    public          testusr    false    219   �3       �          0    16619    users 
   TABLE DATA           P   COPY public.users (id, email, username, password, role, company_id) FROM stdin;
    public          testusr    false    217   67       �           0    0    companies_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.companies_id_seq', 8, true);
          public          testusr    false    214            �           0    0    referral_requests_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.referral_requests_id_seq', 12, true);
          public          testusr    false    220            �           0    0    sessions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sessions_id_seq', 14, true);
          public          testusr    false    218            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 9, true);
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
       public          testusr    false    3356    217    215            �   �   x�M�;�0 ��>EN���^h�T���%VkɲQ�V����7�-�foa܁�-��Aq���M#V�Q�2�!��&saӌhXqM��b)��њĤ/����bC��ȹp�x�:Q(���P�Q]7�� �5.�      �   �  x�}�M��8���W���0�v�3�$5�N����^�݀vd�+	X�}Z�G�&C��[~[<t�ڜ�yM������P��v�a��:�� ��g���5q�p|�xuZ��`IVE�������I����d�!�S��r|',���2�-�]K�����~Z����H�9����yo, sG&�Zzi4
47S|�x��⌋utX�t�UQ0��YqE��;%+���3��Xy� �E����`e�3��h �������N4R]HA2κ؇�Ў ��y��y��5'͖n,�O���k��<���!�ԵPI�����+"�@�-߀�dޣv� �����~��+�v��唶 �0'ot-��&z�3�xt�����=���Qx�>Seb���.������""�C���#*:L�f���/pu�9��X���
�����ox�zc��p�M++<3cf��Z��&pv�}8v��
����Gʞ{�em�E���Y���*�l��e~���5}H��7�#/����}��Qi[!O=��N�"Tl֊@�*IW<g%�E6�����B�t6 m�Ο��1���#�xP.�K�dn���Y��q�=��6KD���x�r<S�2-�S��5��l%�g�gK)�Cf?I��89���nT��N���k�
�C���m��\p��`3����$�����9�jp��{8L(�8�=�6��{K_$X;�{��OF-ί}����ō���G��6z��_ФυtΖ%��W����4X��!]�Gg�����*�⏑V!T��[jv����"#_e���I(v
�T�Ƴey�#<��n��OR���k���M2��T/y�	�c���pI3��=�B�c�4�aMtn�&+�0��2�w-����o6�;i��      �   +  x�e�ٮ�@E������\���EgH'D���trm/���Z��9��������(���@xy�����Y��E<������ b�B�b�KCQ]`���&r~esb���F�iRwn�3ʃ��:>pEA�A��uD!�(ވS�жdZ,��s{,���aE6y�Њ-w�y6�Oъ�k�U5�`X�R2���o$�P(`�ЫS��m;̞��0��m+����qI|��wk�W5z�ZSƪ�oĥP�t��<lt��t��x)��pm.^!���Z<<ӛ��o��#��P����Fq��$�"���q�B�>�6�Ѥ=��ge��`ϔ�x5F�Y�j��eb�Qu�o$R��p�L��*� �zgt��S�����IS����0Ԁ�`P�X0(~h>�(58���]Dނ��y�Y6n]5����k��P�����^�q��A�2��!�X�h�3��F�]8��$���O�m���b��Nsu7q�H��ZjPl���V4o�)Q>��\����'�����|]6���-�;Y��{��Ы����$��o�K� R�/��-S��Քt,����V�W{ ��yh���$4AtD���R)k���5~v��Ƽ'r����a�Iz�z"ݠ�v����|<&AY6݀B�XHH>#| 	�P����V7��o�uI�w��#5kՓ6�Z~w�g��ÐA��3I�xވ�r?��-&q{]6+Oڷ����-y:ݲ���3��y?����%e|�'"�*�5EQ� �^f3      �   �  x�u�Os�0�3|
=GPP�5���bke�!
	��O�خ�����yf���Y`7L��Q\=qM��$�����Bx�'YzJ��N���dgQ=�X���l��3�cE*��\X2�������`�"��,��#�G�=W���q��#g�E��|`#Jс��AjJ�gvdY̹5�������a!+�|h��rTw��H�E��R�T�_)�ԑ8N,� e�_�훁��C��G�<�b����i��7С���ee���[R�(��G79�QQ
��.��P���q�Ŀ={���N��0ca�����&}�8:p�_������հ�C���0�U@$O0�ϫ}�q�QvE�?ޫ��U}ϛ	�M��;Z��&tB�biw��6Y��K����3��mr64u���7'�AU�u�����`s�\'r�W�[��I��ע���_�����П�VQ�������_���T8pDϠ�	��9K�Oļ������ě�X��!M��v�n	��YZ�ZhYN�����M��׶㟳Q�'�y����Ϻ���3|x����ei���o�G@̼	\�W��VV*vȩ'�xe�ʤ��.C_�Q�kM1��q�� �	�立������s�E�f<��}'�I���Z4�u� /���f���E�7�A�     