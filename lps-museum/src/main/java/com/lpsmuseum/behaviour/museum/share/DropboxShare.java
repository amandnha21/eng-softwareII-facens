package com.lpsmuseum.behaviour.museum.share;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Locale;

import com.dropbox.core.DbxAppInfo;
import com.dropbox.core.DbxAuthFinish;
import com.dropbox.core.DbxClient;
import com.dropbox.core.DbxEntry;
import com.dropbox.core.DbxException;
import com.dropbox.core.DbxRequestConfig;
import com.dropbox.core.DbxWebAuthNoRedirect;
import com.dropbox.core.DbxWriteMode;
import com.lpsmuseum.behaviour.museum.Share;
import com.lpsmuseum.dto.Annotation;

public class DropboxShare implements Share {

	public void shareAnnotations(ArrayList<Annotation> annotations) throws IOException, DbxException {
//        String code = new BufferedReader(new InputStreamReader(System.in)).readLine().trim();
//        DbxAuthFinish authFinish = webAuth.finish(code);
//        String accessToken = authFinish.accessToken;
//        DbxClient client = new DbxClient(config, accessToken);
//        System.out.println("Linked account: " + client.getAccountInfo().displayName);
//
//        File inputFile = new File("working-draft.txt");
//        FileInputStream inputStream = new FileInputStream(inputFile);
//        try {
//            DbxEntry.File uploadedFile = client.uploadFile("/magnum-opus.txt",
//                DbxWriteMode.add(), inputFile.length(), inputStream);
//            System.out.println("Uploaded: " + uploadedFile.toString());
//        } finally {
//            inputStream.close();
//        }
	}
	
	public String getAccess(){
		String APP_KEY = "j0trrkgmt20l6wu";
		String APP_SECRET = "fugpzobky27rs21";
		DbxAppInfo appInfo = new DbxAppInfo(APP_KEY, APP_SECRET);
		 DbxRequestConfig config = new DbxRequestConfig(
            "lpsmuseum/1.0", Locale.getDefault().toString());
        DbxWebAuthNoRedirect webAuth = new DbxWebAuthNoRedirect(config, appInfo);
        return webAuth.start();
	}

}
