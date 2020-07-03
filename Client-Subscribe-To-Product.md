# Product Subscription

A client should subscribe to a product to get access to its APIs. 

A client is represented by an **email address**. An email address could be a pool email address that is controlled by the client administrators. All the members of the email pool can use one subscription key.

MR internal staff can use **Azure Active Directory** link to sign in and the external clients should use **Azure Active Directory B2C**.

MR staff are a member of MR AAD group and are known to APIM. This was configured as part of their onboarding process.

![Subscribe for a product - login](./.attachments/product-clients/subscribe-prod/00-subscribe-product-login.JPG)
Figure: B2C Vs internal staff login

After a successful login find the product under the PRODUCTS menu item.

A product is visible if it is published during the deployment process (build pipeline) and you are part of it user group.

If you cannot see a product, ask the product admin to add you to the user group or find the product users' user group (AAD groups for users) and submit a request via the ServiceNow (CIAM) portal - https://mrsnow.service-now.com.

Currently, clients should be in AAD-GRP-Smartbox-DEV-User-Contributor to access the development environments and AAD-GRP-Smartbox-PRD-User-Contributor to access the production environments.

Smartbox developers should be part of these groups as well as the -resource-contributer groups.

![Subscribe for a product - subscribe](./.attachments/product-clients/subscribe-prod/01-subscribe-apis.JPG)
Figure: Subscribe for a product


![Subscribe for a product - Confirm](./.attachments/product-clients/subscribe-prod/02-subscribe-apis-continued.JPG)
Figure: Confirm the subscription


If a product admin completes a client's subscription request the state will be active and client can see the subscription key values by clicking on the show link.

![Subscribe for a product - requested State](./.attachments/product-clients/subscribe-prod/03-subscribe-apis-requested-state.JPG)
Figure: Waiting in the requested state

Microsoft has not developed an automatic notification for the product admin so after 10 minutes send an email to the product admin to complete the subscription process.


When a subscription is successful, the client will recieve an email and by refreshing the web page a client can see the product state is changed from **Requested** to **Active**.

![Subscribe for a product - Activated](./.attachments/product-clients/subscribe-prod/04-subscribe-active-state.JPG)
Figure: Subscription is activated and ready to use

# Product Admin

Product admin won't receive notification about a client's subscription request automatically.

After 10 minutes a product admin can see a row under product > subscriptions and can use the context menu to activate the subscription key.

If you cannot see the notification row after 15 minutes, make sure you have admin access.

![Issue a subscription for a product](./.attachments/product-clients/subscribe-prod/00-admin-subscribe.JPG)
Figure: No request in the subscription section at the start

![Issue a subscription for a product](./.attachments/product-clients/subscribe-prod/02-admin-subscribe-after10m.png)
Figure: After 10 minutes a subscription appears in the list

![Issue a subscription for a product](./.attachments/product-clients/subscribe-prod/03-admin-subscribe-after10m-continue.png)
Figure: Use the context menu to activate a subscription

A user will automatically receive an email when this is done successfully.

