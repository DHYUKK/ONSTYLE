ONSTYLE
=

1. 공모전 소개
- #### 2017 SW 동아리 재능기부챌린지

<pre>
1) 소속 : 계명대학교 경영정보학과 소프트웨어 개발 동아리 '수은불망' 내의 팀 '하모니'
2) 목표 : 지역 소상공인과 협력하여 소셜기반의 맞춤형 코디지원시스템을 개발함으로써 상권 내 동종업계에서 차별화된 경쟁력 확보
3) 기간 : 2017.04 ~ 2017.11
4) 구성원 : 5명
5) 참여도 : 100%
6) 담당업무 : 기획, 분석 및 설계, 개발
7) 주요실적 : 기획, 분석 및 설계와 웹페이지의 가상코디 시뮬레이션, 코디요청, 코디공유 구현
</pre>

2. 개발환경
- #### Spring Framework 3.2.4
```
<dependencies>	
	<!-- MultipartHttpServletRequset -->
	<!-- ## 파일 업로드 서브렛 -->
	<dependency>
		<groupId>commons-io</groupId>
		<artifactId>commons-io</artifactId>
		<version>2.0.1</version>
	</dependency>

	<dependency>
		<groupId>commons-fileupload</groupId>
		<artifactId>commons-fileupload</artifactId>
		<version>1.2.2</version>
	</dependency>

	<!-- json-simple -->
	<dependency>
		<groupId>com.googlecode.json-simple</groupId>
		<artifactId>json-simple</artifactId>
		<version>1.1.1</version>
	</dependency>

	<!-- JSON 관련-->
	<dependency>
		<groupId>net.sf.json-lib</groupId>
		<artifactId>json-lib</artifactId>
		<version>2.4</version>
		<classifier>jdk15</classifier>	
	</dependency>
	<dependency>
		<groupId>org.codehaus.jackson</groupId>
		<artifactId>jackson-mapper-asl</artifactId>
		<version>1.9.13</version>
	</dependency>

	<!-- Spring -->
	<dependency>
		<groupId>org.springframework</groupId>
		<artifactId>spring-context</artifactId>
		<version>${org.springframework-version}</version>
		<exclusions>
			<!-- Exclude Commons Logging in favor of SLF4j -->
			<exclusion>
				<groupId>commons-logging</groupId>
				<artifactId>commons-logging</artifactId>
			</exclusion>
		</exclusions>
	</dependency>
	<dependency>
		<groupId>org.springframework</groupId>
		<artifactId>spring-webmvc</artifactId>
		<version>${org.springframework-version}</version>
	</dependency>

		 <!--보기편한로그 -->
	<dependency>
		 <groupId>org.lazyluke</groupId>
		 <artifactId>log4jdbc-remix</artifactId>
		 <version>0.2.7</version>
	</dependency>	

	<!-- Mysql -->
	<dependency>
		<groupId>org.springframework</groupId>
		<artifactId>spring-jdbc</artifactId>
		<version>3.2.4.RELEASE</version>
	</dependency>

	<dependency>
		<groupId>mysql</groupId>
		<artifactId>mysql-connector-java</artifactId>
		<version>5.1.26</version>
	</dependency>

	<dependency>
		<groupId>org.mybatis</groupId>
		<artifactId>mybatis</artifactId>
		<version>3.2.2</version>
	</dependency>

	<dependency>
		<groupId>org.mybatis</groupId>
		<artifactId>mybatis-spring</artifactId>
		<version>1.1.1</version>
	</dependency>

	<!-- AspectJ -->
	<dependency>
		<groupId>org.aspectj</groupId>
		<artifactId>aspectjrt</artifactId>
		<version>${org.aspectj-version}</version>
	</dependency>	

	<!-- Logging -->
	<dependency>
		<groupId>org.slf4j</groupId>
		<artifactId>slf4j-api</artifactId>
		<version>${org.slf4j-version}</version>
	</dependency>
	<dependency>
		<groupId>org.slf4j</groupId>
		<artifactId>jcl-over-slf4j</artifactId>
		<version>${org.slf4j-version}</version>
		<scope>runtime</scope>
	</dependency>
	<dependency>
		<groupId>org.slf4j</groupId>
		<artifactId>slf4j-log4j12</artifactId>
		<version>${org.slf4j-version}</version>
		<scope>runtime</scope>
	</dependency>
	<dependency>
		<groupId>log4j</groupId>
		<artifactId>log4j</artifactId>
		<version>1.2.15</version>
		<exclusions>
			<exclusion>
				<groupId>javax.mail</groupId>
				<artifactId>mail</artifactId>
			</exclusion>
			<exclusion>
				<groupId>javax.jms</groupId>
				<artifactId>jms</artifactId>
			</exclusion>
			<exclusion>
				<groupId>com.sun.jdmk</groupId>
				<artifactId>jmxtools</artifactId>
			</exclusion>
			<exclusion>
				<groupId>com.sun.jmx</groupId>
				<artifactId>jmxri</artifactId>
			</exclusion>
		</exclusions>
		<scope>runtime</scope>
	</dependency>

	<!-- @Inject -->
	<dependency>
		<groupId>javax.inject</groupId>
		<artifactId>javax.inject</artifactId>
		<version>1</version>
	</dependency>

	<!-- Servlet -->
	<dependency>
		<groupId>javax.servlet</groupId>
		<artifactId>javax.servlet-api</artifactId>
		<version>3.0.1</version>
		<scope>provided</scope>
	</dependency>
	<dependency>
		 <groupId>javax.servlet.jsp</groupId>
		 <artifactId>jsp-api</artifactId>
		 <version>2.2</version>
		 <scope>provided</scope>
	</dependency>
	<dependency>
		 <groupId>javax.servlet</groupId>
		 <artifactId>jstl</artifactId>
		 <version>1.2</version>
	</dependency>

	<!-- Test -->
	<dependency>
		<groupId>junit</groupId>
		<artifactId>junit</artifactId>
		<version>4.7</version>
		<scope>test</scope>
	</dependency>		
</dependencies>
```

3. 주요기능
- #### 사용자 웹
	* https://youtu.be/9XtdQrbn8Ag
	* [상품조회][prodct]
	* [가상코디][virtualCodi]
	* [코디요청][codiReqst]
	* [코디공유게시판][codiShr]

[prodct]:/onStyle/src/main/webapp/WEB-INF/views/consmrView/prodct
[virtualCodi]:/onStyle/src/main/webapp/WEB-INF/views/consmrView/codi/myDressRoom/virtualCodi.jsp
[codiReqst]:/onStyle/src/main/webapp/WEB-INF/views/consmrView/codi/codiReqst
[codiShr]:/onStyle/src/main/webapp/WEB-INF/views/consmrView/codi/codiShr

- #### 관리자 웹

	* [상품관리][admprodct]
	* [주문관리][admordr]
	* [코디요청관리][admcodiReqst]
	* [코디공유게시판관리][admcodiShr]

[admprodct]:/onStyle/src/main/webapp/WEB-INF/views/adminView/prodct
[admordr]:/onStyle/src/main/webapp/WEB-INF/views/adminView/ordr
[admcodiReqst]:/onStyle/src/main/webapp/WEB-INF/views/adminView/codi/codiReqst
[admcodiShr]:/onStyle/src/main/webapp/WEB-INF/views/adminView/codi/codiShr

