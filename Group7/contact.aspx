<%@ Page Language="VB" AutoEventWireup="false" Title="Contact" MasterPageFile="~/Site.Master" CodeFile="contact.aspx.vb" Inherits="contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSContact"
		runat="server"
		DataSourceMode="DataSet"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM Contact"></asp:AccessDataSource>
<%-------------------------------------Data Source-------------------------------------------%>
	<div class="container img-rounded gap-ub">
		<div class="row">
			<div class="col-lg-6">
				<h1>Contact</h1>
				<br />
				<br />
				<asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="ADSContact" CssClass="table table-responsive">
					<ItemTemplate>
						<asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' Visible="false"/>
						<h2><asp:Label ID="firstNameLabel" runat="server" Text='<%# Bind("firstName") %>' />&nbsp;<asp:Label ID="lastNameLabel" runat="server" Text='<%# Bind("lastName") %>' /></h2>
						<br/>
						<p><asp:Label ID="insitutionLabel" runat="server" Text='<%# Bind("insitution") %>' /></p>
						<br/>
						<p><asp:Label ID="departmentLabel" runat="server" Text='<%# Bind("department") %>' /></p>
						<br/>
						<p><asp:Label ID="phoneNumberLabel" runat="server" Text='<%# Bind("phoneNumber") %>' /></p>
						<br/> 
						<p><asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' /></p>
						<br/>
						<p><asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' /></p>
						<br />
					</ItemTemplate>
				</asp:FormView>
				<br />
			</div>
			<div class="col-lg-6">
				<iframe src="http://maps.google.com/maps?client=safari&amp;q=University+of+Ontario+Institute+of+Technology%E2%80%8E+2000+Simcoe+Street+North+Oshawa,+ON+L1H+7K4,+Canada+(905)+721-8668&amp;oe=UTF-8&amp;ie=UTF8&amp;hq=(905)+721-8668&amp;hnear=University+of+Ontario+Institute+of+Technology,+2000+Simcoe+St+N,+Oshawa,+Ontario+L1H+7K4,+Canada&amp;t=m&amp;vpsrc=6&amp;ll=43.94667,-78.894281&amp;spn=0.010814,0.018239&amp;z=15&amp;iwloc=A&amp;output=embed" id="iframe"></iframe>
			</div>
		</div>
	</div>
</asp:Content>

