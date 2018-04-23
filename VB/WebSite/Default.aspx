<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>How to implement a custom popup validation message for ASPxGridView</title>

	<script language="javascript" type="text/javascript">
		function ValidateElement(s, e) {
			if (!e.isValid) {
				popup.SetContentHtml(e.errorText);
				popup.ShowAtElement(s.GetMainElement());
			}
		}
	</script>

</head>
<body>
	<form id="form1" runat="server">
		<dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
			DataSourceID="dsCategories" KeyFieldName="CategoryID">
			<Columns>
				<dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
					<EditFormSettings Visible="False" />
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="0">
					<PropertiesTextEdit>
						<ClientSideEvents Validation="ValidateElement" />
						<ValidationSettings Display="None" EnableCustomValidation="True">
							<RequiredField IsRequired="True" ErrorText="Element is required" />
						</ValidationSettings>
					</PropertiesTextEdit>
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="1">
					<PropertiesTextEdit>
						<ClientSideEvents Validation="ValidateElement" />
						<ValidationSettings Display="None" EnableCustomValidation="True">
							<RequiredField IsRequired="True" ErrorText="Element is required" />
						</ValidationSettings>
					</PropertiesTextEdit>
				</dx:GridViewDataTextColumn>
				<dx:GridViewCommandColumn VisibleIndex="3">
					<EditButton Visible="True">
					</EditButton>
				</dx:GridViewCommandColumn>
			</Columns>
		</dx:ASPxGridView>
		<asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="Data Source=(local);Initial Catalog=Northwind;Integrated Security=True"
			ProviderName="System.Data.SqlClient" SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
		</asp:SqlDataSource>
		<dx:ASPxPopupControl ID="popup" runat="server" ClientInstanceName="popup" PopupAction="None"
			PopupHorizontalAlign="OutsideRight" PopupVerticalAlign="TopSides" BackColor="#FFE1E1"
			CloseAction="MouseOut" DisappearAfter="1500" ForeColor="Red" ShowHeader="False">
		</dx:ASPxPopupControl>
	</form>
</body>
</html>
