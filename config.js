// Configuration publique du client Supabase. Cette clé est visible dans le navigateur : c’est normal.
// N’utilise JAMAIS une clé service_role / secret ici. Les politiques RLS protègent les données.
window.BILLARD_CONFIG = {
  url: 'https://VOTRE-PROJET.supabase.co',
  anonKey: 'COLLER_ICI_LA_CLE_PUBLISHABLE_OU_ANON'
};
