PGDMP                 	        x            voluntariadodb     11.7 (Ubuntu 11.7-2.pgdg18.04+1)     12.2 (Ubuntu 12.2-2.pgdg18.04+1) .    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    32849    voluntariadodb    DATABASE     ?   CREATE DATABASE voluntariadodb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_CL.UTF-8' LC_CTYPE = 'es_CL.UTF-8';
    DROP DATABASE voluntariadodb;
                postgres    false            ?            1259    32881    eme_habilidad    TABLE     ?   CREATE TABLE public.eme_habilidad (
    id numeric(8,0) NOT NULL,
    id_emergencia numeric(6,0),
    id_habilidad numeric(4,0)
);
 !   DROP TABLE public.eme_habilidad;
       public            postgres    false            ?            1259    32858 
   emergencia    TABLE     ?   CREATE TABLE public.emergencia (
    id numeric(6,0) NOT NULL,
    nombre character varying(100),
    descrip character varying(400),
    finicio date,
    ffin date,
    id_institucion numeric(4,0)
);
    DROP TABLE public.emergencia;
       public            postgres    false            ?            1259    32876    estado_tarea    TABLE     f   CREATE TABLE public.estado_tarea (
    id numeric(2,0) NOT NULL,
    descrip character varying(20)
);
     DROP TABLE public.estado_tarea;
       public            postgres    false            ?            1259    32871 	   habilidad    TABLE     d   CREATE TABLE public.habilidad (
    id numeric(4,0) NOT NULL,
    descrip character varying(100)
);
    DROP TABLE public.habilidad;
       public            postgres    false            ?            1259    32850    institucion    TABLE     ?   CREATE TABLE public.institucion (
    id numeric(4,0) NOT NULL,
    nombre character varying(100),
    descrip character varying(400)
);
    DROP TABLE public.institucion;
       public            postgres    false            ?            1259    33072    ranking    TABLE     ?   CREATE TABLE public.ranking (
    id numeric(8,0) NOT NULL,
    id_voluntario numeric(8,0),
    id_tarea numeric(8,0),
    puntaje numeric(3,0),
    flg_invitado numeric(1,0),
    flg_participa numeric(1,0)
);
    DROP TABLE public.ranking;
       public            postgres    false            ?           0    0    TABLE ranking    COMMENT     u   COMMENT ON TABLE public.ranking IS 'los flgInvitado, flgParticipa 1 si la respuesta es si, 2 si la respuesta es no';
          public          postgres    false    205            ?            1259    32896    tarea    TABLE     *  CREATE TABLE public.tarea (
    id numeric(8,0) NOT NULL,
    nombre character varying(60),
    descrip character varying(300),
    cant_vol_requeridos numeric(4,0),
    cant_vol_inscritos numeric(4,0),
    id_emergencia numeric(6,0),
    finicio date,
    ffin date,
    id_estado numeric(2,0)
);
    DROP TABLE public.tarea;
       public            postgres    false            ?            1259    32911    tarea_habilidad    TABLE     }   CREATE TABLE public.tarea_habilidad (
    id numeric(8,0) NOT NULL,
    id_emehab numeric(8,0),
    id_tarea numeric(8,0)
);
 #   DROP TABLE public.tarea_habilidad;
       public            postgres    false            ?            1259    32931    vol_habilidad    TABLE     ?   CREATE TABLE public.vol_habilidad (
    id numeric(8,0) NOT NULL,
    id_voluntario numeric(8,0),
    id_habilidad numeric(8,0)
);
 !   DROP TABLE public.vol_habilidad;
       public            postgres    false            ?            1259    32926 
   voluntario    TABLE     z   CREATE TABLE public.voluntario (
    id numeric(8,0) NOT NULL,
    nombre character varying(100),
    fnacimiento date
);
    DROP TABLE public.voluntario;
       public            postgres    false            ?          0    32881    eme_habilidad 
   TABLE DATA                 public          postgres    false    200   ?3       ?          0    32858 
   emergencia 
   TABLE DATA                 public          postgres    false    197   4       ?          0    32876    estado_tarea 
   TABLE DATA                 public          postgres    false    199   14       ?          0    32871 	   habilidad 
   TABLE DATA                 public          postgres    false    198   K4       ?          0    32850    institucion 
   TABLE DATA                 public          postgres    false    196   e4       ?          0    33072    ranking 
   TABLE DATA                 public          postgres    false    205   4       ?          0    32896    tarea 
   TABLE DATA                 public          postgres    false    201   ?4       ?          0    32911    tarea_habilidad 
   TABLE DATA                 public          postgres    false    202   ?4       ?          0    32931    vol_habilidad 
   TABLE DATA                 public          postgres    false    204   ?4       ?          0    32926 
   voluntario 
   TABLE DATA                 public          postgres    false    203   ?4       F           2606    32885     eme_habilidad eme_habilidad_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.eme_habilidad
    ADD CONSTRAINT eme_habilidad_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.eme_habilidad DROP CONSTRAINT eme_habilidad_pkey;
       public            postgres    false    200            @           2606    32865    emergencia emergencia_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.emergencia
    ADD CONSTRAINT emergencia_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.emergencia DROP CONSTRAINT emergencia_pkey;
       public            postgres    false    197            D           2606    32880    estado_tarea estado_tarea_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.estado_tarea
    ADD CONSTRAINT estado_tarea_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.estado_tarea DROP CONSTRAINT estado_tarea_pkey;
       public            postgres    false    199            B           2606    32875    habilidad habilidad_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.habilidad
    ADD CONSTRAINT habilidad_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.habilidad DROP CONSTRAINT habilidad_pkey;
       public            postgres    false    198            >           2606    32857    institucion institucion_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.institucion
    ADD CONSTRAINT institucion_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.institucion DROP CONSTRAINT institucion_pkey;
       public            postgres    false    196            P           2606    33076    ranking ranking_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT ranking_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.ranking DROP CONSTRAINT ranking_pkey;
       public            postgres    false    205            J           2606    32915 $   tarea_habilidad tarea_habilidad_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tarea_habilidad
    ADD CONSTRAINT tarea_habilidad_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.tarea_habilidad DROP CONSTRAINT tarea_habilidad_pkey;
       public            postgres    false    202            H           2606    32900    tarea tarea_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tarea DROP CONSTRAINT tarea_pkey;
       public            postgres    false    201            N           2606    32935     vol_habilidad vol_habilidad_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.vol_habilidad
    ADD CONSTRAINT vol_habilidad_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.vol_habilidad DROP CONSTRAINT vol_habilidad_pkey;
       public            postgres    false    204            L           2606    32930    voluntario voluntario_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.voluntario
    ADD CONSTRAINT voluntario_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.voluntario DROP CONSTRAINT voluntario_pkey;
       public            postgres    false    203            R           2606    32886 "   eme_habilidad fk_emehab_emergencia    FK CONSTRAINT     ?   ALTER TABLE ONLY public.eme_habilidad
    ADD CONSTRAINT fk_emehab_emergencia FOREIGN KEY (id_emergencia) REFERENCES public.emergencia(id);
 L   ALTER TABLE ONLY public.eme_habilidad DROP CONSTRAINT fk_emehab_emergencia;
       public          postgres    false    200    2880    197            S           2606    32891 !   eme_habilidad fk_emehab_habilidad    FK CONSTRAINT     ?   ALTER TABLE ONLY public.eme_habilidad
    ADD CONSTRAINT fk_emehab_habilidad FOREIGN KEY (id_habilidad) REFERENCES public.habilidad(id);
 K   ALTER TABLE ONLY public.eme_habilidad DROP CONSTRAINT fk_emehab_habilidad;
       public          postgres    false    198    2882    200            Q           2606    32866 $   emergencia fk_emergencia_institucion    FK CONSTRAINT     ?   ALTER TABLE ONLY public.emergencia
    ADD CONSTRAINT fk_emergencia_institucion FOREIGN KEY (id_institucion) REFERENCES public.institucion(id);
 N   ALTER TABLE ONLY public.emergencia DROP CONSTRAINT fk_emergencia_institucion;
       public          postgres    false    196    2878    197            Z           2606    33077    ranking fk_ranking_tarea    FK CONSTRAINT     x   ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT fk_ranking_tarea FOREIGN KEY (id_tarea) REFERENCES public.tarea(id);
 B   ALTER TABLE ONLY public.ranking DROP CONSTRAINT fk_ranking_tarea;
       public          postgres    false    201    205    2888            [           2606    33082    ranking fk_ranking_voluntario    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT fk_ranking_voluntario FOREIGN KEY (id_voluntario) REFERENCES public.voluntario(id);
 G   ALTER TABLE ONLY public.ranking DROP CONSTRAINT fk_ranking_voluntario;
       public          postgres    false    203    205    2892            T           2606    32901    tarea fk_tarea_emergencia    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT fk_tarea_emergencia FOREIGN KEY (id_emergencia) REFERENCES public.emergencia(id);
 C   ALTER TABLE ONLY public.tarea DROP CONSTRAINT fk_tarea_emergencia;
       public          postgres    false    201    2880    197            U           2606    32906    tarea fk_tarea_estadotarea    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT fk_tarea_estadotarea FOREIGN KEY (id_estado) REFERENCES public.estado_tarea(id);
 D   ALTER TABLE ONLY public.tarea DROP CONSTRAINT fk_tarea_estadotarea;
       public          postgres    false    199    2884    201            V           2606    32916 "   tarea_habilidad fk_tareahab_emehab    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tarea_habilidad
    ADD CONSTRAINT fk_tareahab_emehab FOREIGN KEY (id_emehab) REFERENCES public.eme_habilidad(id);
 L   ALTER TABLE ONLY public.tarea_habilidad DROP CONSTRAINT fk_tareahab_emehab;
       public          postgres    false    202    200    2886            W           2606    32921 !   tarea_habilidad fk_tareahab_tarea    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tarea_habilidad
    ADD CONSTRAINT fk_tareahab_tarea FOREIGN KEY (id_tarea) REFERENCES public.tarea(id);
 K   ALTER TABLE ONLY public.tarea_habilidad DROP CONSTRAINT fk_tareahab_tarea;
       public          postgres    false    201    202    2888            Y           2606    32941 !   vol_habilidad fk_volhab_habilidad    FK CONSTRAINT     ?   ALTER TABLE ONLY public.vol_habilidad
    ADD CONSTRAINT fk_volhab_habilidad FOREIGN KEY (id_habilidad) REFERENCES public.habilidad(id);
 K   ALTER TABLE ONLY public.vol_habilidad DROP CONSTRAINT fk_volhab_habilidad;
       public          postgres    false    198    2882    204            X           2606    32936 "   vol_habilidad fk_volhab_voluntario    FK CONSTRAINT     ?   ALTER TABLE ONLY public.vol_habilidad
    ADD CONSTRAINT fk_volhab_voluntario FOREIGN KEY (id_voluntario) REFERENCES public.voluntario(id);
 L   ALTER TABLE ONLY public.vol_habilidad DROP CONSTRAINT fk_volhab_voluntario;
       public          postgres    false    2892    204    203            ?   
   x???          ?   
   x???          ?   
   x???          ?   
   x???          ?   
   x???          ?   
   x???          ?   
   x???          ?   
   x???          ?   
   x???          ?   
   x???         