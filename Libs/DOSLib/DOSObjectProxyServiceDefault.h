﻿/****************************************************************************/
/*                                                                          */
/*      文件名:    DOSObjectProxyService.h                                  */
/*      创建日期:  2009年07月06日                                           */
/*      作者:      Sagasarate                                               */
/*                                                                          */
/*      本软件版权归Sagasarate(sagasarate@sina.com)所有                     */
/*      你可以将本软件用于任何商业和非商业软件开发，但                      */
/*      必须保留此版权声明                                                  */
/*                                                                          */
/****************************************************************************/
#pragma once


class CDOSObjectProxyServiceDefault :
	public IDOSObjectProxyServiceBase,
	public CNetService, 
	public CEasyThread
{
protected:
	CLIENT_PROXY_CONFIG											m_Config;
	CThreadSafeIDStorage<CDOSMessagePacket *>					m_MsgQueue;
	CStaticMap<MSG_ID_TYPE, OBJECT_ID>							m_MessageMap;

	CEasyCriticalSection										m_EasyCriticalSection;
	CThreadPerformanceCounter									m_ThreadPerformanceCounter;
	OBJECT_ID													m_UnhandleMsgReceiverID;


	CIDStorage<CDOSObjectProxyConnectionDefault>				m_ConnectionPool;
	static CEasyBuffer											m_CompressBuffer;

public:
	CDOSObjectProxyServiceDefault(void);
	virtual ~CDOSObjectProxyServiceDefault(void);
	
	
	virtual UINT AddUseRef();
	virtual void Release();
	virtual void Destory();
	BYTE GetProxyType();
	virtual void SetID(UINT ID);
	virtual UINT GetID();
	virtual bool StartService();
	virtual void StopService();
	virtual bool PushMessage(CDOSMessagePacket * pPacket);
	virtual bool PushBroadcastMessage(CDOSMessagePacket * pPacket);
	virtual IDOSObjectProxyConnectionBase * GetConnection(UINT ID);
	virtual float GetCPUUsedRate();
	virtual float GetCycleTime();




	bool Init(CDOSServer * pServer, CLIENT_PROXY_CONFIG& Config);
	


	virtual BOOL OnStart();
	virtual BOOL OnRun();
	virtual void OnTerminate();

	virtual void OnClose();
	virtual int Update(int ProcessPacketLimit = DEFAULT_SERVER_PROCESS_PACKET_LIMIT);
	virtual CBaseNetConnection * CreateConnection(CIPAddress& RemoteAddress);
	virtual BOOL DeleteConnection(CBaseNetConnection * pConnection);	


	OBJECT_ID GetGlobalMsgMapObjectID(MSG_ID_TYPE MsgID);
	OBJECT_ID GetUnhandleMsgReceiverID();

	CLIENT_PROXY_CONFIG& GetConfig()
	{
		return m_Config;
	}
	

	

	CEasyBuffer& GetCompressBuffer()
	{
		return m_CompressBuffer;
	}

protected:
	void OnMsg(CDOSMessage * pMessage);
	void OnSystemMsg(CDOSMessage * pMessage);
	bool DoRegisterGlobalMsgMap(MSG_ID_TYPE MsgID, OBJECT_ID ObjectID);
	bool DoUnregisterGlobalMsgMap(MSG_ID_TYPE MsgID, OBJECT_ID ObjectID);
	void ClearMsgMapByRouterID(UINT RouterID);
};


